﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using SchoolManagementSystem.Models;
using SchoolManagementSystem.Models.ViewModel;
using School = SchoolManagementSystem.Models.School;

namespace SchoolManagementSystem.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SchoolsController : ControllerBase
    {
        private readonly SchoolDbContext _context;

        public SchoolsController(SchoolDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        [Route("GetBuilding")]
        public async Task<ActionResult<IEnumerable<Building>>> GetBuilding()
        {
            return await _context.Buildings.ToListAsync();
        }

        [HttpGet]
        [Route("GetSchools")]
        public async Task<ActionResult<IEnumerable<School>>> GetSchools()
        {
            return await _context.Schools.Include(c=>c.Buildings).ToListAsync();
        }

        // GET: api/Schools/5
        [HttpGet("{id}")]
        public async Task<ActionResult<School>> GetSchool(int id)
        {
            var school = await _context.Schools.FindAsync(id);

            if (school == null)
            {
                return NotFound();
            }

            return school;
        }

        // PUT: api/Schools/5
        [HttpPut("{id}")]
        public async Task<IActionResult> PutSchool(int id, School school)
        {
            if (id != school.SchoolId)
            {
                return BadRequest();
            }

            _context.Entry(school).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!SchoolExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/Schools
        [HttpPost]
        public async Task<ActionResult<School>> PostSchool([FromForm] School school)
        {
            _context.Schools.Add(school);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetSchool", new { id = school.SchoolId }, school);
        }

        // DELETE: api/Schools/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteSchool(int id)
        {
            var school = await _context.Schools.FindAsync(id);
            if (school == null)
            {
                return NotFound();
            }

            _context.Schools.Remove(school);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool SchoolExists(int id)
        {
            return _context.Schools.Any(e => e.SchoolId == id);
        }
    }
}
