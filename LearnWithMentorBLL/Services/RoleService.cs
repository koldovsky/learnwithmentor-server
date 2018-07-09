﻿using System.Collections.Generic;
using System.Linq;
using LearnWithMentorBLL.Interfaces;
using LearnWithMentorDTO;
using LearnWithMentorDAL.Entities;
using LearnWithMentorDAL.UnitOfWork;

namespace LearnWithMentorBLL.Services
{
    public class RoleService : BaseService, IRoleService
    {
        public RoleService(IUnitOfWork db) : base(db)
        {
        }
        public RoleDTO Get(int id)
        {
            var role = db.Roles.Get(id);
            return role == null ? null :
                new RoleDTO(role.Id, role.Name);
        }
        public List<RoleDTO> GetAllRoles()
        {
            var roles = db.Roles.GetAll();
            if (!roles.Any())
                return null;
            List<RoleDTO> dtos = new List<RoleDTO>();
            foreach (var role in roles)
            {
                dtos.Add(new RoleDTO(role.Id, role.Name));
            }
            return dtos;
        }
        public RoleDTO GetByName(string name)
        {
            Role role;
            if (!db.Roles.TryGetByName(name, out role))
                return null;
            return new RoleDTO(role.Id, role.Name);
        }
    }
}
