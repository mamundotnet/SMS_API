﻿namespace SchoolManagementSystem.Models
{
    public class Section
    {
        public int SectionId { get; set; }
        public string SectionName { get; set; } = default!;
        public virtual ICollection<CampusClassSection> ClassSections { get; set; }=new List<CampusClassSection>();
    }
}
