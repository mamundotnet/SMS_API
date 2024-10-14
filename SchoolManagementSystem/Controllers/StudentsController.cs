using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using SchoolManagementSystem.Models;
using SchoolManagementSystem.Models.ViewModel;

namespace SchoolManagementSystem.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class StudentsController : ControllerBase
    {
        private IWebHostEnvironment _env;
        private readonly SchoolDbContext _context;

        public StudentsController(SchoolDbContext context, IWebHostEnvironment env)
        {
            _context = context;
            _env = env;
        }

        // GET: api/Students

        [HttpGet]
        public async Task<ActionResult<IEnumerable<Student>>> GetStudents()
        {
            return await _context.Students.Include(c => c.StudentGuardians).Include(c => c.StudentCampusClassSection).ToListAsync();
        }

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

        // POST: api/Students
        [HttpPost]
        public async Task<ActionResult<Student>> PostStudent([FromForm] StudentVM vm)
        {
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

            _context.Students.Add(student);
            await _context.SaveChangesAsync();
            return Ok(student);
        }


        [Route("Update")]
        [HttpPut]
        public async Task<ActionResult<Student>> UpdateStudent([FromForm] StudentVM vm)
        {

            Student student = _context.Students.Find(vm.StudentId);

            student.StudentFName = vm.StudentFName;
            student.StudentLName = vm.StudentLName;
            student.FatherName=vm.FatherName;
            student.MotherName=vm.MotherName;
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

            _context.Entry(student).State = EntityState.Modified;
            await _context.SaveChangesAsync();
            return Ok(student);
        }

        [Route("Delete/{id}")]
        [HttpDelete]
        public async Task<ActionResult<Student>> DeleteStudent(int id)
        {
            Student student = _context.Students.Find(id); 

            _context.Entry(student).State = EntityState.Deleted;
            await _context.SaveChangesAsync();
            return Ok(student);
        }

    }
}

             