package com.facedops.note.web.utils;

import java.util.Collection;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Path;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.data.jpa.domain.Specification;

import com.google.common.collect.Lists;

public class BaseService{
	public static <T> Specification<T> bySearchFilter(final Collection<SearchFilter> filters, final Class<T> entityClazz) {
		return new Specification<T>() {
			public Predicate toPredicate(Root<T> root, CriteriaQuery<?> query,
					CriteriaBuilder builder) {
				List<Predicate> predicates=Lists.newArrayList();
				for(SearchFilter filter:filters){
					Path expression = root.get(filter.fieldName);
					switch(filter.operator){
					case EQ:
						predicates.add(builder.equal(expression, filter.value));
						break;
					case LIKE:
						predicates.add(builder.like(expression, "%" + filter.value + "%"));
						break;
					case GT:
						predicates.add(builder.greaterThan(expression, (Comparable) filter.value));
						break;
					case LT:
						predicates.add(builder.lessThan(expression, (Comparable) filter.value));
						break;
					case GTE:
						predicates.add(builder.greaterThanOrEqualTo(expression, (Comparable) filter.value));
						break;
					case LTE:
						predicates.add(builder.lessThanOrEqualTo(expression, (Comparable) filter.value));
						break;
					}
				}
				if (!predicates.isEmpty()) {
					return builder.and(predicates.toArray(new Predicate[predicates.size()]));
				}
				return builder.conjunction();
			}
			
		};
	}
}
