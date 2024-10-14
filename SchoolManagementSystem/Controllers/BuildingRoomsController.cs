using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using SchoolManagementSystem.Models;

namespace SchoolManagementSystem.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BuildingRoomsController : ControllerBase
    {
        private readonly SchoolDbContext _context;

        public BuildingRoomsController(SchoolDbContext context)
        {
            _context = context;
        }

        // GET: api/BuildingRooms
        [HttpGet]
        public async Task<ActionResult<IEnumerable<BuildingRoom>>> GetBuildingRooms()
        {
            return await _context.BuildingRooms.ToListAsync();
        }

        // GET: api/BuildingRooms/5
        [HttpGet("{id}")]
        public async Task<ActionResult<BuildingRoom>> GetBuildingRoom(int id)
        {
            var buildingRoom = await _context.BuildingRooms.FindAsync(id);

            if (buildingRoom == null)
            {
                return NotFound();
            }

            return buildingRoom;
        }

        // PUT: api/BuildingRooms/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutBuildingRoom(int id, BuildingRoom buildingRoom)
        {
            if (id != buildingRoom.BuildingRoomId)
            {
                return BadRequest();
            }

            _context.Entry(buildingRoom).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!BuildingRoomExists(id))
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

        // POST: api/BuildingRooms

        [HttpPost]
        public async Task<ActionResult<BuildingRoom>> PostBuildingRoom([FromForm] BuildingRoom buildingRoom)
        {
            _context.BuildingRooms.Add(buildingRoom);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetBuildingRoom", new { id = buildingRoom.BuildingRoomId }, buildingRoom);
        }

        // DELETE: api/BuildingRooms/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteBuildingRoom(int id)
        {
            var buildingRoom = await _context.BuildingRooms.FindAsync(id);
            if (buildingRoom == null)
            {
                return NotFound();
            }

            _context.BuildingRooms.Remove(buildingRoom);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool BuildingRoomExists(int id)
        {
            return _context.BuildingRooms.Any(e => e.BuildingRoomId == id);
        }
    }
}
