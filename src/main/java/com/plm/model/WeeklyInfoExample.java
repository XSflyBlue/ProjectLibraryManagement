package com.plm.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

public class WeeklyInfoExample {
    /**
	 * This field was generated by MyBatis Generator. This field corresponds to the database table weekly_info
	 * @mbg.generated  Tue May 15 22:59:52 CST 2018
	 */
	protected String orderByClause;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database table weekly_info
	 * @mbg.generated  Tue May 15 22:59:52 CST 2018
	 */
	protected boolean distinct;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database table weekly_info
	 * @mbg.generated  Tue May 15 22:59:52 CST 2018
	 */
	protected List<Criteria> oredCriteria;

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table weekly_info
	 * @mbg.generated  Tue May 15 22:59:52 CST 2018
	 */
	public WeeklyInfoExample() {
		oredCriteria = new ArrayList<Criteria>();
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table weekly_info
	 * @mbg.generated  Tue May 15 22:59:52 CST 2018
	 */
	public void setOrderByClause(String orderByClause) {
		this.orderByClause = orderByClause;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table weekly_info
	 * @mbg.generated  Tue May 15 22:59:52 CST 2018
	 */
	public String getOrderByClause() {
		return orderByClause;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table weekly_info
	 * @mbg.generated  Tue May 15 22:59:52 CST 2018
	 */
	public void setDistinct(boolean distinct) {
		this.distinct = distinct;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table weekly_info
	 * @mbg.generated  Tue May 15 22:59:52 CST 2018
	 */
	public boolean isDistinct() {
		return distinct;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table weekly_info
	 * @mbg.generated  Tue May 15 22:59:52 CST 2018
	 */
	public List<Criteria> getOredCriteria() {
		return oredCriteria;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table weekly_info
	 * @mbg.generated  Tue May 15 22:59:52 CST 2018
	 */
	public void or(Criteria criteria) {
		oredCriteria.add(criteria);
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table weekly_info
	 * @mbg.generated  Tue May 15 22:59:52 CST 2018
	 */
	public Criteria or() {
		Criteria criteria = createCriteriaInternal();
		oredCriteria.add(criteria);
		return criteria;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table weekly_info
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
	 * This method was generated by MyBatis Generator. This method corresponds to the database table weekly_info
	 * @mbg.generated  Tue May 15 22:59:52 CST 2018
	 */
	protected Criteria createCriteriaInternal() {
		Criteria criteria = new Criteria();
		return criteria;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table weekly_info
	 * @mbg.generated  Tue May 15 22:59:52 CST 2018
	 */
	public void clear() {
		oredCriteria.clear();
		orderByClause = null;
		distinct = false;
	}

	/**
	 * This class was generated by MyBatis Generator. This class corresponds to the database table weekly_info
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

		protected void addCriterionForJDBCDate(String condition, Date value, String property) {
			if (value == null) {
				throw new RuntimeException("Value for " + property + " cannot be null");
			}
			addCriterion(condition, new java.sql.Date(value.getTime()), property);
		}

		protected void addCriterionForJDBCDate(String condition, List<Date> values, String property) {
			if (values == null || values.size() == 0) {
				throw new RuntimeException("Value list for " + property + " cannot be null or empty");
			}
			List<java.sql.Date> dateList = new ArrayList<java.sql.Date>();
			Iterator<Date> iter = values.iterator();
			while (iter.hasNext()) {
				dateList.add(new java.sql.Date(iter.next().getTime()));
			}
			addCriterion(condition, dateList, property);
		}

		protected void addCriterionForJDBCDate(String condition, Date value1, Date value2, String property) {
			if (value1 == null || value2 == null) {
				throw new RuntimeException("Between values for " + property + " cannot be null");
			}
			addCriterion(condition, new java.sql.Date(value1.getTime()), new java.sql.Date(value2.getTime()), property);
		}

		public Criteria andWIdIsNull() {
			addCriterion("W_ID is null");
			return (Criteria) this;
		}

		public Criteria andWIdIsNotNull() {
			addCriterion("W_ID is not null");
			return (Criteria) this;
		}

		public Criteria andWIdEqualTo(Integer value) {
			addCriterion("W_ID =", value, "wId");
			return (Criteria) this;
		}

		public Criteria andWIdNotEqualTo(Integer value) {
			addCriterion("W_ID <>", value, "wId");
			return (Criteria) this;
		}

		public Criteria andWIdGreaterThan(Integer value) {
			addCriterion("W_ID >", value, "wId");
			return (Criteria) this;
		}

		public Criteria andWIdGreaterThanOrEqualTo(Integer value) {
			addCriterion("W_ID >=", value, "wId");
			return (Criteria) this;
		}

		public Criteria andWIdLessThan(Integer value) {
			addCriterion("W_ID <", value, "wId");
			return (Criteria) this;
		}

		public Criteria andWIdLessThanOrEqualTo(Integer value) {
			addCriterion("W_ID <=", value, "wId");
			return (Criteria) this;
		}

		public Criteria andWIdIn(List<Integer> values) {
			addCriterion("W_ID in", values, "wId");
			return (Criteria) this;
		}

		public Criteria andWIdNotIn(List<Integer> values) {
			addCriterion("W_ID not in", values, "wId");
			return (Criteria) this;
		}

		public Criteria andWIdBetween(Integer value1, Integer value2) {
			addCriterion("W_ID between", value1, value2, "wId");
			return (Criteria) this;
		}

		public Criteria andWIdNotBetween(Integer value1, Integer value2) {
			addCriterion("W_ID not between", value1, value2, "wId");
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

		public Criteria andWStartTimeIsNull() {
			addCriterion("W_START_TIME is null");
			return (Criteria) this;
		}

		public Criteria andWStartTimeIsNotNull() {
			addCriterion("W_START_TIME is not null");
			return (Criteria) this;
		}

		public Criteria andWStartTimeEqualTo(Date value) {
			addCriterionForJDBCDate("W_START_TIME =", value, "wStartTime");
			return (Criteria) this;
		}

		public Criteria andWStartTimeNotEqualTo(Date value) {
			addCriterionForJDBCDate("W_START_TIME <>", value, "wStartTime");
			return (Criteria) this;
		}

		public Criteria andWStartTimeGreaterThan(Date value) {
			addCriterionForJDBCDate("W_START_TIME >", value, "wStartTime");
			return (Criteria) this;
		}

		public Criteria andWStartTimeGreaterThanOrEqualTo(Date value) {
			addCriterionForJDBCDate("W_START_TIME >=", value, "wStartTime");
			return (Criteria) this;
		}

		public Criteria andWStartTimeLessThan(Date value) {
			addCriterionForJDBCDate("W_START_TIME <", value, "wStartTime");
			return (Criteria) this;
		}

		public Criteria andWStartTimeLessThanOrEqualTo(Date value) {
			addCriterionForJDBCDate("W_START_TIME <=", value, "wStartTime");
			return (Criteria) this;
		}

		public Criteria andWStartTimeIn(List<Date> values) {
			addCriterionForJDBCDate("W_START_TIME in", values, "wStartTime");
			return (Criteria) this;
		}

		public Criteria andWStartTimeNotIn(List<Date> values) {
			addCriterionForJDBCDate("W_START_TIME not in", values, "wStartTime");
			return (Criteria) this;
		}

		public Criteria andWStartTimeBetween(Date value1, Date value2) {
			addCriterionForJDBCDate("W_START_TIME between", value1, value2, "wStartTime");
			return (Criteria) this;
		}

		public Criteria andWStartTimeNotBetween(Date value1, Date value2) {
			addCriterionForJDBCDate("W_START_TIME not between", value1, value2, "wStartTime");
			return (Criteria) this;
		}

		public Criteria andWEndTimeIsNull() {
			addCriterion("W_END_TIME is null");
			return (Criteria) this;
		}

		public Criteria andWEndTimeIsNotNull() {
			addCriterion("W_END_TIME is not null");
			return (Criteria) this;
		}

		public Criteria andWEndTimeEqualTo(Date value) {
			addCriterionForJDBCDate("W_END_TIME =", value, "wEndTime");
			return (Criteria) this;
		}

		public Criteria andWEndTimeNotEqualTo(Date value) {
			addCriterionForJDBCDate("W_END_TIME <>", value, "wEndTime");
			return (Criteria) this;
		}

		public Criteria andWEndTimeGreaterThan(Date value) {
			addCriterionForJDBCDate("W_END_TIME >", value, "wEndTime");
			return (Criteria) this;
		}

		public Criteria andWEndTimeGreaterThanOrEqualTo(Date value) {
			addCriterionForJDBCDate("W_END_TIME >=", value, "wEndTime");
			return (Criteria) this;
		}

		public Criteria andWEndTimeLessThan(Date value) {
			addCriterionForJDBCDate("W_END_TIME <", value, "wEndTime");
			return (Criteria) this;
		}

		public Criteria andWEndTimeLessThanOrEqualTo(Date value) {
			addCriterionForJDBCDate("W_END_TIME <=", value, "wEndTime");
			return (Criteria) this;
		}

		public Criteria andWEndTimeIn(List<Date> values) {
			addCriterionForJDBCDate("W_END_TIME in", values, "wEndTime");
			return (Criteria) this;
		}

		public Criteria andWEndTimeNotIn(List<Date> values) {
			addCriterionForJDBCDate("W_END_TIME not in", values, "wEndTime");
			return (Criteria) this;
		}

		public Criteria andWEndTimeBetween(Date value1, Date value2) {
			addCriterionForJDBCDate("W_END_TIME between", value1, value2, "wEndTime");
			return (Criteria) this;
		}

		public Criteria andWEndTimeNotBetween(Date value1, Date value2) {
			addCriterionForJDBCDate("W_END_TIME not between", value1, value2, "wEndTime");
			return (Criteria) this;
		}

		public Criteria andWThisWeekIsNull() {
			addCriterion("W_THIS_WEEK is null");
			return (Criteria) this;
		}

		public Criteria andWThisWeekIsNotNull() {
			addCriterion("W_THIS_WEEK is not null");
			return (Criteria) this;
		}

		public Criteria andWThisWeekEqualTo(String value) {
			addCriterion("W_THIS_WEEK =", value, "wThisWeek");
			return (Criteria) this;
		}

		public Criteria andWThisWeekNotEqualTo(String value) {
			addCriterion("W_THIS_WEEK <>", value, "wThisWeek");
			return (Criteria) this;
		}

		public Criteria andWThisWeekGreaterThan(String value) {
			addCriterion("W_THIS_WEEK >", value, "wThisWeek");
			return (Criteria) this;
		}

		public Criteria andWThisWeekGreaterThanOrEqualTo(String value) {
			addCriterion("W_THIS_WEEK >=", value, "wThisWeek");
			return (Criteria) this;
		}

		public Criteria andWThisWeekLessThan(String value) {
			addCriterion("W_THIS_WEEK <", value, "wThisWeek");
			return (Criteria) this;
		}

		public Criteria andWThisWeekLessThanOrEqualTo(String value) {
			addCriterion("W_THIS_WEEK <=", value, "wThisWeek");
			return (Criteria) this;
		}

		public Criteria andWThisWeekLike(String value) {
			addCriterion("W_THIS_WEEK like", value, "wThisWeek");
			return (Criteria) this;
		}

		public Criteria andWThisWeekNotLike(String value) {
			addCriterion("W_THIS_WEEK not like", value, "wThisWeek");
			return (Criteria) this;
		}

		public Criteria andWThisWeekIn(List<String> values) {
			addCriterion("W_THIS_WEEK in", values, "wThisWeek");
			return (Criteria) this;
		}

		public Criteria andWThisWeekNotIn(List<String> values) {
			addCriterion("W_THIS_WEEK not in", values, "wThisWeek");
			return (Criteria) this;
		}

		public Criteria andWThisWeekBetween(String value1, String value2) {
			addCriterion("W_THIS_WEEK between", value1, value2, "wThisWeek");
			return (Criteria) this;
		}

		public Criteria andWThisWeekNotBetween(String value1, String value2) {
			addCriterion("W_THIS_WEEK not between", value1, value2, "wThisWeek");
			return (Criteria) this;
		}

		public Criteria andWNextWeekIsNull() {
			addCriterion("W_NEXT_WEEK is null");
			return (Criteria) this;
		}

		public Criteria andWNextWeekIsNotNull() {
			addCriterion("W_NEXT_WEEK is not null");
			return (Criteria) this;
		}

		public Criteria andWNextWeekEqualTo(String value) {
			addCriterion("W_NEXT_WEEK =", value, "wNextWeek");
			return (Criteria) this;
		}

		public Criteria andWNextWeekNotEqualTo(String value) {
			addCriterion("W_NEXT_WEEK <>", value, "wNextWeek");
			return (Criteria) this;
		}

		public Criteria andWNextWeekGreaterThan(String value) {
			addCriterion("W_NEXT_WEEK >", value, "wNextWeek");
			return (Criteria) this;
		}

		public Criteria andWNextWeekGreaterThanOrEqualTo(String value) {
			addCriterion("W_NEXT_WEEK >=", value, "wNextWeek");
			return (Criteria) this;
		}

		public Criteria andWNextWeekLessThan(String value) {
			addCriterion("W_NEXT_WEEK <", value, "wNextWeek");
			return (Criteria) this;
		}

		public Criteria andWNextWeekLessThanOrEqualTo(String value) {
			addCriterion("W_NEXT_WEEK <=", value, "wNextWeek");
			return (Criteria) this;
		}

		public Criteria andWNextWeekLike(String value) {
			addCriterion("W_NEXT_WEEK like", value, "wNextWeek");
			return (Criteria) this;
		}

		public Criteria andWNextWeekNotLike(String value) {
			addCriterion("W_NEXT_WEEK not like", value, "wNextWeek");
			return (Criteria) this;
		}

		public Criteria andWNextWeekIn(List<String> values) {
			addCriterion("W_NEXT_WEEK in", values, "wNextWeek");
			return (Criteria) this;
		}

		public Criteria andWNextWeekNotIn(List<String> values) {
			addCriterion("W_NEXT_WEEK not in", values, "wNextWeek");
			return (Criteria) this;
		}

		public Criteria andWNextWeekBetween(String value1, String value2) {
			addCriterion("W_NEXT_WEEK between", value1, value2, "wNextWeek");
			return (Criteria) this;
		}

		public Criteria andWNextWeekNotBetween(String value1, String value2) {
			addCriterion("W_NEXT_WEEK not between", value1, value2, "wNextWeek");
			return (Criteria) this;
		}

		public Criteria andWStatusIsNull() {
			addCriterion("W_STATUS is null");
			return (Criteria) this;
		}

		public Criteria andWStatusIsNotNull() {
			addCriterion("W_STATUS is not null");
			return (Criteria) this;
		}

		public Criteria andWStatusEqualTo(Integer value) {
			addCriterion("W_STATUS =", value, "wStatus");
			return (Criteria) this;
		}

		public Criteria andWStatusNotEqualTo(Integer value) {
			addCriterion("W_STATUS <>", value, "wStatus");
			return (Criteria) this;
		}

		public Criteria andWStatusGreaterThan(Integer value) {
			addCriterion("W_STATUS >", value, "wStatus");
			return (Criteria) this;
		}

		public Criteria andWStatusGreaterThanOrEqualTo(Integer value) {
			addCriterion("W_STATUS >=", value, "wStatus");
			return (Criteria) this;
		}

		public Criteria andWStatusLessThan(Integer value) {
			addCriterion("W_STATUS <", value, "wStatus");
			return (Criteria) this;
		}

		public Criteria andWStatusLessThanOrEqualTo(Integer value) {
			addCriterion("W_STATUS <=", value, "wStatus");
			return (Criteria) this;
		}

		public Criteria andWStatusIn(List<Integer> values) {
			addCriterion("W_STATUS in", values, "wStatus");
			return (Criteria) this;
		}

		public Criteria andWStatusNotIn(List<Integer> values) {
			addCriterion("W_STATUS not in", values, "wStatus");
			return (Criteria) this;
		}

		public Criteria andWStatusBetween(Integer value1, Integer value2) {
			addCriterion("W_STATUS between", value1, value2, "wStatus");
			return (Criteria) this;
		}

		public Criteria andWStatusNotBetween(Integer value1, Integer value2) {
			addCriterion("W_STATUS not between", value1, value2, "wStatus");
			return (Criteria) this;
		}

		public Criteria andWOpinionIsNull() {
			addCriterion("W_OPINION is null");
			return (Criteria) this;
		}

		public Criteria andWOpinionIsNotNull() {
			addCriterion("W_OPINION is not null");
			return (Criteria) this;
		}

		public Criteria andWOpinionEqualTo(String value) {
			addCriterion("W_OPINION =", value, "wOpinion");
			return (Criteria) this;
		}

		public Criteria andWOpinionNotEqualTo(String value) {
			addCriterion("W_OPINION <>", value, "wOpinion");
			return (Criteria) this;
		}

		public Criteria andWOpinionGreaterThan(String value) {
			addCriterion("W_OPINION >", value, "wOpinion");
			return (Criteria) this;
		}

		public Criteria andWOpinionGreaterThanOrEqualTo(String value) {
			addCriterion("W_OPINION >=", value, "wOpinion");
			return (Criteria) this;
		}

		public Criteria andWOpinionLessThan(String value) {
			addCriterion("W_OPINION <", value, "wOpinion");
			return (Criteria) this;
		}

		public Criteria andWOpinionLessThanOrEqualTo(String value) {
			addCriterion("W_OPINION <=", value, "wOpinion");
			return (Criteria) this;
		}

		public Criteria andWOpinionLike(String value) {
			addCriterion("W_OPINION like", value, "wOpinion");
			return (Criteria) this;
		}

		public Criteria andWOpinionNotLike(String value) {
			addCriterion("W_OPINION not like", value, "wOpinion");
			return (Criteria) this;
		}

		public Criteria andWOpinionIn(List<String> values) {
			addCriterion("W_OPINION in", values, "wOpinion");
			return (Criteria) this;
		}

		public Criteria andWOpinionNotIn(List<String> values) {
			addCriterion("W_OPINION not in", values, "wOpinion");
			return (Criteria) this;
		}

		public Criteria andWOpinionBetween(String value1, String value2) {
			addCriterion("W_OPINION between", value1, value2, "wOpinion");
			return (Criteria) this;
		}

		public Criteria andWOpinionNotBetween(String value1, String value2) {
			addCriterion("W_OPINION not between", value1, value2, "wOpinion");
			return (Criteria) this;
		}
	}

	/**
	 * This class was generated by MyBatis Generator. This class corresponds to the database table weekly_info
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
     * This class corresponds to the database table weekly_info
     *
     * @mbg.generated do_not_delete_during_merge Sun May 06 20:50:13 CST 2018
     */
    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }
}