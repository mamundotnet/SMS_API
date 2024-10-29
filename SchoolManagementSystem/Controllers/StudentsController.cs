using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using SchoolManagementSystem.Models;
using SchoolManagementSystem.Models.ViewModel;

namespace SchoolManagementSystem.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class StudentsController : ControllerBase
    {
        private readonly SchoolDbContext _context;
        private readonly IWebHostEnvironment _env;
        public StudentsController(SchoolDbContext context, IWebHostEnvironment env)
        {
            _context = context;
            _env = env;
        }

        //GET: api/Students
        [HttpGet]
        public async Task<ActionResult<IEnumerable<StudentCampusClassSection>>> GetStudents()
        {
            return await _context.StudentCampusClassSections.Include(x => x.Student).Include(x => x.Student!.Gender).Include(sccs => sccs.CampusClassSection).ThenInclude(sccs => sccs!.CampusClass).ThenInclude(sccs => sccs!.Campus).Include(scss => scss.CampusClassSection!.Section).Include(scss => scss.CampusClassSection!.CampusClass!.Class).ToListAsync();

        }



        //[HttpGet]
        //public async Task<ActionResult<IEnumerable<object>>> GetStudents()
        //{
        //    var students = await _context.StudentCampusClassSections
        //        .Include(x => x.Student)
        //        .ThenInclude(x => x.Gender)
        //        .Include(sccs => sccs.CampusClassSection)
        //        .ThenInclude(sccs => sccs!.CampusClass)
        //        .ThenInclude(sccs => sccs!.Campus)
        //        .Include(scss => scss.CampusClassSection!.Section)
        //        .Include(scss => scss.CampusClassSection!.CampusClass!.Class)
        //        .Select(s => new
        //        {
        //            s.StudentId, // Student ID
        //            StudentFName = s.Student!.StudentFName, // Student first name
        //            StudentLName = s.Student!.StudentLName, // Student last name
        //            FatherName = s.Student!.FatherName, // Student father name
        //            MotherName = s.Student!.MotherName, // Student mother name
        //            DateOfBirth = s.Student!.DateOfBirth, // Date of birth
        //            BirthCertificateNumber = s.Student!.BirthCertificateNumber, // Birth certificate
        //            Image = s.Student!.Image, // Student image
        //            Address = s.Student!.Address, // Student address
        //            GenderId = s.Student!.GenderId, // Gender ID
        //            CampusClassSection = s.CampusClassSection != null ? new
        //            {
        //                s.CampusClassSectionId, // Campus Class Section ID
        //                Campus = s.CampusClassSection.CampusClass!.Campus != null ? s.CampusClassSection.CampusClass.Campus!.Name : null, // Campus name
        //                Class = s.CampusClassSection.CampusClass.Class != null ? s.CampusClassSection.CampusClass.Class.ClassName : null, // Class name
        //                Section = s.CampusClassSection.Section != null ? s.CampusClassSection.Section.SectionName : null // Section name
        //            } : null // If no CampusClassSection, return null
        //        })
        //        .ToListAsync();

        //    return Ok(students);
        //}







        // GET: api/Students/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Student>> GetStudent(int id)
        {
            var student = await _context.Students.FindAsync(id);

            if (student == null)
            {
                return NotFound();
            }

            return student;
        }

        // PUT: api/Students/5
        [HttpPut("{id}")]
        public async Task<IActionResult> PutStudent([FromForm] int id, StudentVM vm)
        {
            if (id != vm.StudentId)
            {
                return BadRequest();
            }

            Student student = _context.Students.Find(vm.StudentId);

            student.StudentFName = vm.StudentFName;
            student.StudentLName = vm.StudentLName;
            student.FatherName = vm.FatherName;
            student.MotherName = vm.MotherName;
            student.BirthCertificateNumber = vm.BirthCertificateNumber;
            student.DateOfBirth = vm.DateOfBirth;
            student.Address = vm.Address;
            student.GenderId = vm.GenderId;
            student.Image = vm.Image;

            if (vm.ImagePath != null)
            {
                var webroot = _env.WebRootPath;
                var fileName = Guid.NewGuid().ToString() + Path.GetExtension(vm.ImagePath.FileName);
                var filePath = Path.Combine(webroot, "Images", fileName);

                FileStream fileStream = new FileStream(filePath, FileMode.Create);
                await vm.ImagePath.CopyToAsync(fileStream);
                await fileStream.FlushAsync();
                fileStream.Close();
                student.Image = fileName;
            }
            var campusClass = new CampusClass
            {
                CampusId = vm.CampusId,
                ClassId = vm.ClassId,
            };
            _context.Add(campusClass);
            var campusClassSection = new CampusClassSection
            {
                CampusClass = campusClass,
                CampusClassId = campusClass.CampusClassId,
                SectionId = vm.SectionId,
            };
            _context.Add(campusClassSection);
            var studentCampusClassSection = new StudentCampusClassSection
            {
                CampusClassSection = campusClassSection,
                StudentCampusClassSectionId = campusClassSection.CampusClassSectionId,
                Student = student,
                StudentId = student.StudentId
            };
            _context.Add(studentCampusClassSection);

            _context.Entry(student).State = EntityState.Modified;
            await _context.SaveChangesAsync();
            return Ok(student);
        }



        [HttpPost]
        public async Task<ActionResult<Student>> PostStudentWithCampusClassSection([FromForm] StudentVM vm)
        {
            // Create a new Student object
            Student student = new Student
            {
                StudentFName = vm.StudentFName,
                StudentLName = vm.StudentLName,
                FatherName = vm.FatherName,
                MotherName = vm.MotherName,
                DateOfBirth = vm.DateOfBirth,
                BirthCertificateNumber = vm.BirthCertificateNumber,
                Address = vm.Address,
                GenderId = vm.GenderId
            };

            // If the student has an image, save it
            if (vm.ImagePath != null)
            {
                var webroot = _env.WebRootPath;
                var fileName = DateTime.Now.Ticks.ToString() + Path.GetExtension(vm.ImagePath.FileName);
                var filePath = Path.Combine(webroot, "Images", fileName);

                FileStream fileStream = new FileStream(filePath, FileMode.Create);
                await vm.ImagePath.CopyToAsync(fileStream);
                await fileStream.FlushAsync();
                fileStream.Close();
                student.Image = fileName;
            }
            var campusClass = new CampusClass
            {
                CampusId = vm.CampusId,
                ClassId = vm.ClassId,
            };
            _context.Add(campusClass);
            var campusClassSection = new CampusClassSection
            {
                CampusClass = campusClass,
                CampusClassId = campusClass.CampusClassId,
                SectionId = vm.SectionId,
            };
            _context.Add(campusClassSection);
            var studentCampusClassSection = new StudentCampusClassSection
            {
                CampusClassSection = campusClassSection,
                StudentCampusClassSectionId = campusClassSection.CampusClassSectionId,
                Student = student,
                StudentId = student.StudentId
            };
            _context.Add(studentCampusClassSection);

            // Save the student entity
            _context.Students.Add(student);
            await _context.SaveChangesAsync();



            return Ok(student);
        }


        // DELETE: api/Students/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteStudent(int id)
        {
            var student = await _context.Students.FindAsync(id);
            if (student == null)
            {
                return NotFound();
            }

            _context.Students.Remove(student);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool StudentExists(int id)
        {
            return _context.Students.Any(e => e.StudentId == id);
        }
    }
}
