﻿using LearnWithMentorDAL.Entities;

namespace LearnWithMentorDAL.Repositories
{
    public class PlanTaskRepository: BaseRepository<PlanTask>, IPlanTaskRepository
    {
        public PlanTaskRepository(LearnWithMentor_DBEntities _context) : base(_context)
        {
        }
    }
}