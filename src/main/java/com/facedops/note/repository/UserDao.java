package com.facedops.note.repository;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.facedops.note.entity.rbac.Users;

public interface UserDao extends PagingAndSortingRepository<Users, Long>, JpaSpecificationExecutor<Users>  {

}
