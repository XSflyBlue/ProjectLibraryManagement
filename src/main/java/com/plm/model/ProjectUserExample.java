package com.plm.model;

import java.util.ArrayList;
import java.util.List;

public class ProjectUserExample {
    /**
	 * This field was generated by MyBatis Generator. This field corresponds to the database table project_user
	 * @mbg.generated  Tue May 15 22:59:52 CST 2018
	 */
	protected String orderByClause;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database table project_user
	 * @mbg.generated  Tue May 15 22:59:52 CST 2018
	 */
	protected boolean distinct;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database table project_user
	 * @mbg.generated  Tue May 15 22:59:52 CST 2018
	 */
	protected List<Criteria> oredCriteria;

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table project_user
	 * @mbg.generated  Tue May 15 22:59:52 CST 2018
	 */
	public ProjectUserExample() {
		oredCriteria = new ArrayList<Criteria>();
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table project_user
	 * @mbg.generated  Tue May 15 22:59:52 CST 2018
	 */
	public void setOrderByClause(String orderByClause) {
		this.orderByClause = orderByClause;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table project_user
	 * @mbg.generated  Tue May 15 22:59:52 CST 2018
	 */
	public String getOrderByClause() {
		return orderByClause;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table project_user
	 * @mbg.generated  Tue May 15 22:59:52 CST 2018
	 */
	public void setDistinct(boolean distinct) {
		this.distinct = distinct;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table project_user
	 * @mbg.generated  Tue May 15 22:59:52 CST 2018
	 */
	public boolean isDistinct() {
		return distinct;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table project_user
	 * @mbg.generated  Tue May 15 22:59:52 CST 2018
	 */
	public List<Criteria> getOredCriteria() {
		return oredCriteria;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table project_user
	 * @mbg.generated  Tue May 15 22:59:52 CST 2018
	 */
	public void or(Criteria criteria) {
		oredCriteria.add(criteria);
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table project_user
	 * @mbg.generated  Tue May 15 22:59:52 CST 2018
	 */
	public Criteria or() {
		Criteria criteria = createCriteriaInternal();
		oredCriteria.add(criteria);
		return criteria;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table project_user
	 * @mbg.generated  Tue May 15 22:59:52 CST 2018
	 */
	public Criteria createCriteria() {
		Criteria criteria = createCriteriaInternal();
		if (oredCriteria.size() == 0) {
			oredCriteria.add(criteria);
		}
		return criteria;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table project_user
	 * @mbg.generated  Tue May 15 22:59:52 CST 2018
	 */
	protected Criteria createCriteriaInternal() {
		Criteria criteria = new Criteria();
		return criteria;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table project_user
	 * @mbg.generated  Tue May 15 22:59:52 CST 2018
	 */
	public void clear() {
		oredCriteria.clear();
		orderByClause = null;
		distinct = false;
	}

	/**
	 * This class was generated by MyBatis Generator. This class corresponds to the database table project_user
	 * @mbg.generated  Tue May 15 22:59:52 CST 2018
	 */
	protected abstract static class GeneratedCriteria {
		protected List<Criterion> criteria;

		protected GeneratedCriteria() {
			super();
			criteria = new ArrayList<Criterion>();
		}

		public boolean isValid() {
			return criteria.size() > 0;
		}

		public List<Criterion> getAllCriteria() {
			return criteria;
		}

		public List<Criterion> getCriteria() {
			return criteria;
		}

		protected void addCriterion(String condition) {
			if (condition == null) {
				throw new RuntimeException("Value for condition cannot be null");
			}
			criteria.add(new Criterion(condition));
		}

		protected void addCriterion(String condition, Object value, String property) {
			if (value == null) {
				throw new RuntimeException("Value for " + property + " cannot be null");
			}
			criteria.add(new Criterion(condition, value));
		}

		protected void addCriterion(String condition, Object value1, Object value2, String property) {
			if (value1 == null || value2 == null) {
				throw new RuntimeException("Between values for " + property + " cannot be null");
			}
			criteria.add(new Criterion(condition, value1, value2));
		}

		public Criteria andPuIdIsNull() {
			addCriterion("PU_ID is null");
			return (Criteria) this;
		}

		public Criteria andPuIdIsNotNull() {
			addCriterion("PU_ID is not null");
			return (Criteria) this;
		}

		public Criteria andPuIdEqualTo(Integer value) {
			addCriterion("PU_ID =", value, "puId");
			return (Criteria) this;
		}

		public Criteria andPuIdNotEqualTo(Integer value) {
			addCriterion("PU_ID <>", value, "puId");
			return (Criteria) this;
		}

		public Criteria andPuIdGreaterThan(Integer value) {
			addCriterion("PU_ID >", value, "puId");
			return (Criteria) this;
		}

		public Criteria andPuIdGreaterThanOrEqualTo(Integer value) {
			addCriterion("PU_ID >=", value, "puId");
			return (Criteria) this;
		}

		public Criteria andPuIdLessThan(Integer value) {
			addCriterion("PU_ID <", value, "puId");
			return (Criteria) this;
		}

		public Criteria andPuIdLessThanOrEqualTo(Integer value) {
			addCriterion("PU_ID <=", value, "puId");
			return (Criteria) this;
		}

		public Criteria andPuIdIn(List<Integer> values) {
			addCriterion("PU_ID in", values, "puId");
			return (Criteria) this;
		}

		public Criteria andPuIdNotIn(List<Integer> values) {
			addCriterion("PU_ID not in", values, "puId");
			return (Criteria) this;
		}

		public Criteria andPuIdBetween(Integer value1, Integer value2) {
			addCriterion("PU_ID between", value1, value2, "puId");
			return (Criteria) this;
		}

		public Criteria andPuIdNotBetween(Integer value1, Integer value2) {
			addCriterion("PU_ID not between", value1, value2, "puId");
			return (Criteria) this;
		}

		public Criteria andUIdIsNull() {
			addCriterion("U_ID is null");
			return (Criteria) this;
		}

		public Criteria andUIdIsNotNull() {
			addCriterion("U_ID is not null");
			return (Criteria) this;
		}

		public Criteria andUIdEqualTo(Integer value) {
			addCriterion("U_ID =", value, "uId");
			return (Criteria) this;
		}

		public Criteria andUIdNotEqualTo(Integer value) {
			addCriterion("U_ID <>", value, "uId");
			return (Criteria) this;
		}

		public Criteria andUIdGreaterThan(Integer value) {
			addCriterion("U_ID >", value, "uId");
			return (Criteria) this;
		}

		public Criteria andUIdGreaterThanOrEqualTo(Integer value) {
			addCriterion("U_ID >=", value, "uId");
			return (Criteria) this;
		}

		public Criteria andUIdLessThan(Integer value) {
			addCriterion("U_ID <", value, "uId");
			return (Criteria) this;
		}

		public Criteria andUIdLessThanOrEqualTo(Integer value) {
			addCriterion("U_ID <=", value, "uId");
			return (Criteria) this;
		}

		public Criteria andUIdIn(List<Integer> values) {
			addCriterion("U_ID in", values, "uId");
			return (Criteria) this;
		}

		public Criteria andUIdNotIn(List<Integer> values) {
			addCriterion("U_ID not in", values, "uId");
			return (Criteria) this;
		}

		public Criteria andUIdBetween(Integer value1, Integer value2) {
			addCriterion("U_ID between", value1, value2, "uId");
			return (Criteria) this;
		}

		public Criteria andUIdNotBetween(Integer value1, Integer value2) {
			addCriterion("U_ID not between", value1, value2, "uId");
			return (Criteria) this;
		}

		public Criteria andPbIdIsNull() {
			addCriterion("PB_ID is null");
			return (Criteria) this;
		}

		public Criteria andPbIdIsNotNull() {
			addCriterion("PB_ID is not null");
			return (Criteria) this;
		}

		public Criteria andPbIdEqualTo(Integer value) {
			addCriterion("PB_ID =", value, "pbId");
			return (Criteria) this;
		}

		public Criteria andPbIdNotEqualTo(Integer value) {
			addCriterion("PB_ID <>", value, "pbId");
			return (Criteria) this;
		}

		public Criteria andPbIdGreaterThan(Integer value) {
			addCriterion("PB_ID >", value, "pbId");
			return (Criteria) this;
		}

		public Criteria andPbIdGreaterThanOrEqualTo(Integer value) {
			addCriterion("PB_ID >=", value, "pbId");
			return (Criteria) this;
		}

		public Criteria andPbIdLessThan(Integer value) {
			addCriterion("PB_ID <", value, "pbId");
			return (Criteria) this;
		}

		public Criteria andPbIdLessThanOrEqualTo(Integer value) {
			addCriterion("PB_ID <=", value, "pbId");
			return (Criteria) this;
		}

		public Criteria andPbIdIn(List<Integer> values) {
			addCriterion("PB_ID in", values, "pbId");
			return (Criteria) this;
		}

		public Criteria andPbIdNotIn(List<Integer> values) {
			addCriterion("PB_ID not in", values, "pbId");
			return (Criteria) this;
		}

		public Criteria andPbIdBetween(Integer value1, Integer value2) {
			addCriterion("PB_ID between", value1, value2, "pbId");
			return (Criteria) this;
		}

		public Criteria andPbIdNotBetween(Integer value1, Integer value2) {
			addCriterion("PB_ID not between", value1, value2, "pbId");
			return (Criteria) this;
		}

		public Criteria andUTypeIsNull() {
			addCriterion("U_TYPE is null");
			return (Criteria) this;
		}

		public Criteria andUTypeIsNotNull() {
			addCriterion("U_TYPE is not null");
			return (Criteria) this;
		}

		public Criteria andUTypeEqualTo(Integer value) {
			addCriterion("U_TYPE =", value, "uType");
			return (Criteria) this;
		}

		public Criteria andUTypeNotEqualTo(Integer value) {
			addCriterion("U_TYPE <>", value, "uType");
			return (Criteria) this;
		}

		public Criteria andUTypeGreaterThan(Integer value) {
			addCriterion("U_TYPE >", value, "uType");
			return (Criteria) this;
		}

		public Criteria andUTypeGreaterThanOrEqualTo(Integer value) {
			addCriterion("U_TYPE >=", value, "uType");
			return (Criteria) this;
		}

		public Criteria andUTypeLessThan(Integer value) {
			addCriterion("U_TYPE <", value, "uType");
			return (Criteria) this;
		}

		public Criteria andUTypeLessThanOrEqualTo(Integer value) {
			addCriterion("U_TYPE <=", value, "uType");
			return (Criteria) this;
		}

		public Criteria andUTypeIn(List<Integer> values) {
			addCriterion("U_TYPE in", values, "uType");
			return (Criteria) this;
		}

		public Criteria andUTypeNotIn(List<Integer> values) {
			addCriterion("U_TYPE not in", values, "uType");
			return (Criteria) this;
		}

		public Criteria andUTypeBetween(Integer value1, Integer value2) {
			addCriterion("U_TYPE between", value1, value2, "uType");
			return (Criteria) this;
		}

		public Criteria andUTypeNotBetween(Integer value1, Integer value2) {
			addCriterion("U_TYPE not between", value1, value2, "uType");
			return (Criteria) this;
		}
	}

	/**
	 * This class was generated by MyBatis Generator. This class corresponds to the database table project_user
	 * @mbg.generated  Tue May 15 22:59:52 CST 2018
	 */
	public static class Criterion {
		private String condition;
		private Object value;
		private Object secondValue;
		private boolean noValue;
		private boolean singleValue;
		private boolean betweenValue;
		private boolean listValue;
		private String typeHandler;

		public String getCondition() {
			return condition;
		}

		public Object getValue() {
			return value;
		}

		public Object getSecondValue() {
			return secondValue;
		}

		public boolean isNoValue() {
			return noValue;
		}

		public boolean isSingleValue() {
			return singleValue;
		}

		public boolean isBetweenValue() {
			return betweenValue;
		}

		public boolean isListValue() {
			return listValue;
		}

		public String getTypeHandler() {
			return typeHandler;
		}

		protected Criterion(String condition) {
			super();
			this.condition = condition;
			this.typeHandler = null;
			this.noValue = true;
		}

		protected Criterion(String condition, Object value, String typeHandler) {
			super();
			this.condition = condition;
			this.value = value;
			this.typeHandler = typeHandler;
			if (value instanceof List<?>) {
				this.listValue = true;
			} else {
				this.singleValue = true;
			}
		}

		protected Criterion(String condition, Object value) {
			this(condition, value, null);
		}

		protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
			super();
			this.condition = condition;
			this.value = value;
			this.secondValue = secondValue;
			this.typeHandler = typeHandler;
			this.betweenValue = true;
		}

		protected Criterion(String condition, Object value, Object secondValue) {
			this(condition, value, secondValue, null);
		}
	}

	/**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table project_user
     *
     * @mbg.generated do_not_delete_during_merge Mon May 14 20:31:26 CST 2018
     */
    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }
}