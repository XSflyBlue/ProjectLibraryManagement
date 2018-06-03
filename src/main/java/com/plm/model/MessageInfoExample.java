package com.plm.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class MessageInfoExample {
    /**
	 * This field was generated by MyBatis Generator. This field corresponds to the database table message_info
	 * @mbg.generated  Tue May 15 22:59:52 CST 2018
	 */
	protected String orderByClause;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database table message_info
	 * @mbg.generated  Tue May 15 22:59:52 CST 2018
	 */
	protected boolean distinct;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database table message_info
	 * @mbg.generated  Tue May 15 22:59:52 CST 2018
	 */
	protected List<Criteria> oredCriteria;

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table message_info
	 * @mbg.generated  Tue May 15 22:59:52 CST 2018
	 */
	public MessageInfoExample() {
		oredCriteria = new ArrayList<Criteria>();
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table message_info
	 * @mbg.generated  Tue May 15 22:59:52 CST 2018
	 */
	public void setOrderByClause(String orderByClause) {
		this.orderByClause = orderByClause;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table message_info
	 * @mbg.generated  Tue May 15 22:59:52 CST 2018
	 */
	public String getOrderByClause() {
		return orderByClause;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table message_info
	 * @mbg.generated  Tue May 15 22:59:52 CST 2018
	 */
	public void setDistinct(boolean distinct) {
		this.distinct = distinct;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table message_info
	 * @mbg.generated  Tue May 15 22:59:52 CST 2018
	 */
	public boolean isDistinct() {
		return distinct;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table message_info
	 * @mbg.generated  Tue May 15 22:59:52 CST 2018
	 */
	public List<Criteria> getOredCriteria() {
		return oredCriteria;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table message_info
	 * @mbg.generated  Tue May 15 22:59:52 CST 2018
	 */
	public void or(Criteria criteria) {
		oredCriteria.add(criteria);
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table message_info
	 * @mbg.generated  Tue May 15 22:59:52 CST 2018
	 */
	public Criteria or() {
		Criteria criteria = createCriteriaInternal();
		oredCriteria.add(criteria);
		return criteria;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table message_info
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
	 * This method was generated by MyBatis Generator. This method corresponds to the database table message_info
	 * @mbg.generated  Tue May 15 22:59:52 CST 2018
	 */
	protected Criteria createCriteriaInternal() {
		Criteria criteria = new Criteria();
		return criteria;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table message_info
	 * @mbg.generated  Tue May 15 22:59:52 CST 2018
	 */
	public void clear() {
		oredCriteria.clear();
		orderByClause = null;
		distinct = false;
	}

	/**
	 * This class was generated by MyBatis Generator. This class corresponds to the database table message_info
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

		public Criteria andMIdIsNull() {
			addCriterion("M_ID is null");
			return (Criteria) this;
		}

		public Criteria andMIdIsNotNull() {
			addCriterion("M_ID is not null");
			return (Criteria) this;
		}

		public Criteria andMIdEqualTo(Integer value) {
			addCriterion("M_ID =", value, "mId");
			return (Criteria) this;
		}

		public Criteria andMIdNotEqualTo(Integer value) {
			addCriterion("M_ID <>", value, "mId");
			return (Criteria) this;
		}

		public Criteria andMIdGreaterThan(Integer value) {
			addCriterion("M_ID >", value, "mId");
			return (Criteria) this;
		}

		public Criteria andMIdGreaterThanOrEqualTo(Integer value) {
			addCriterion("M_ID >=", value, "mId");
			return (Criteria) this;
		}

		public Criteria andMIdLessThan(Integer value) {
			addCriterion("M_ID <", value, "mId");
			return (Criteria) this;
		}

		public Criteria andMIdLessThanOrEqualTo(Integer value) {
			addCriterion("M_ID <=", value, "mId");
			return (Criteria) this;
		}

		public Criteria andMIdIn(List<Integer> values) {
			addCriterion("M_ID in", values, "mId");
			return (Criteria) this;
		}

		public Criteria andMIdNotIn(List<Integer> values) {
			addCriterion("M_ID not in", values, "mId");
			return (Criteria) this;
		}

		public Criteria andMIdBetween(Integer value1, Integer value2) {
			addCriterion("M_ID between", value1, value2, "mId");
			return (Criteria) this;
		}

		public Criteria andMIdNotBetween(Integer value1, Integer value2) {
			addCriterion("M_ID not between", value1, value2, "mId");
			return (Criteria) this;
		}

		public Criteria andMTitleIsNull() {
			addCriterion("M_TITLE is null");
			return (Criteria) this;
		}

		public Criteria andMTitleIsNotNull() {
			addCriterion("M_TITLE is not null");
			return (Criteria) this;
		}

		public Criteria andMTitleEqualTo(String value) {
			addCriterion("M_TITLE =", value, "mTitle");
			return (Criteria) this;
		}

		public Criteria andMTitleNotEqualTo(String value) {
			addCriterion("M_TITLE <>", value, "mTitle");
			return (Criteria) this;
		}

		public Criteria andMTitleGreaterThan(String value) {
			addCriterion("M_TITLE >", value, "mTitle");
			return (Criteria) this;
		}

		public Criteria andMTitleGreaterThanOrEqualTo(String value) {
			addCriterion("M_TITLE >=", value, "mTitle");
			return (Criteria) this;
		}

		public Criteria andMTitleLessThan(String value) {
			addCriterion("M_TITLE <", value, "mTitle");
			return (Criteria) this;
		}

		public Criteria andMTitleLessThanOrEqualTo(String value) {
			addCriterion("M_TITLE <=", value, "mTitle");
			return (Criteria) this;
		}

		public Criteria andMTitleLike(String value) {
			addCriterion("M_TITLE like", value, "mTitle");
			return (Criteria) this;
		}

		public Criteria andMTitleNotLike(String value) {
			addCriterion("M_TITLE not like", value, "mTitle");
			return (Criteria) this;
		}

		public Criteria andMTitleIn(List<String> values) {
			addCriterion("M_TITLE in", values, "mTitle");
			return (Criteria) this;
		}

		public Criteria andMTitleNotIn(List<String> values) {
			addCriterion("M_TITLE not in", values, "mTitle");
			return (Criteria) this;
		}

		public Criteria andMTitleBetween(String value1, String value2) {
			addCriterion("M_TITLE between", value1, value2, "mTitle");
			return (Criteria) this;
		}

		public Criteria andMTitleNotBetween(String value1, String value2) {
			addCriterion("M_TITLE not between", value1, value2, "mTitle");
			return (Criteria) this;
		}

		public Criteria andMContentIsNull() {
			addCriterion("M_CONTENT is null");
			return (Criteria) this;
		}

		public Criteria andMContentIsNotNull() {
			addCriterion("M_CONTENT is not null");
			return (Criteria) this;
		}

		public Criteria andMContentEqualTo(String value) {
			addCriterion("M_CONTENT =", value, "mContent");
			return (Criteria) this;
		}

		public Criteria andMContentNotEqualTo(String value) {
			addCriterion("M_CONTENT <>", value, "mContent");
			return (Criteria) this;
		}

		public Criteria andMContentGreaterThan(String value) {
			addCriterion("M_CONTENT >", value, "mContent");
			return (Criteria) this;
		}

		public Criteria andMContentGreaterThanOrEqualTo(String value) {
			addCriterion("M_CONTENT >=", value, "mContent");
			return (Criteria) this;
		}

		public Criteria andMContentLessThan(String value) {
			addCriterion("M_CONTENT <", value, "mContent");
			return (Criteria) this;
		}

		public Criteria andMContentLessThanOrEqualTo(String value) {
			addCriterion("M_CONTENT <=", value, "mContent");
			return (Criteria) this;
		}

		public Criteria andMContentLike(String value) {
			addCriterion("M_CONTENT like", value, "mContent");
			return (Criteria) this;
		}

		public Criteria andMContentNotLike(String value) {
			addCriterion("M_CONTENT not like", value, "mContent");
			return (Criteria) this;
		}

		public Criteria andMContentIn(List<String> values) {
			addCriterion("M_CONTENT in", values, "mContent");
			return (Criteria) this;
		}

		public Criteria andMContentNotIn(List<String> values) {
			addCriterion("M_CONTENT not in", values, "mContent");
			return (Criteria) this;
		}

		public Criteria andMContentBetween(String value1, String value2) {
			addCriterion("M_CONTENT between", value1, value2, "mContent");
			return (Criteria) this;
		}

		public Criteria andMContentNotBetween(String value1, String value2) {
			addCriterion("M_CONTENT not between", value1, value2, "mContent");
			return (Criteria) this;
		}

		public Criteria andSendTimeIsNull() {
			addCriterion("SEND_TIME is null");
			return (Criteria) this;
		}

		public Criteria andSendTimeIsNotNull() {
			addCriterion("SEND_TIME is not null");
			return (Criteria) this;
		}

		public Criteria andSendTimeEqualTo(Date value) {
			addCriterion("SEND_TIME =", value, "sendTime");
			return (Criteria) this;
		}

		public Criteria andSendTimeNotEqualTo(Date value) {
			addCriterion("SEND_TIME <>", value, "sendTime");
			return (Criteria) this;
		}

		public Criteria andSendTimeGreaterThan(Date value) {
			addCriterion("SEND_TIME >", value, "sendTime");
			return (Criteria) this;
		}

		public Criteria andSendTimeGreaterThanOrEqualTo(Date value) {
			addCriterion("SEND_TIME >=", value, "sendTime");
			return (Criteria) this;
		}

		public Criteria andSendTimeLessThan(Date value) {
			addCriterion("SEND_TIME <", value, "sendTime");
			return (Criteria) this;
		}

		public Criteria andSendTimeLessThanOrEqualTo(Date value) {
			addCriterion("SEND_TIME <=", value, "sendTime");
			return (Criteria) this;
		}

		public Criteria andSendTimeIn(List<Date> values) {
			addCriterion("SEND_TIME in", values, "sendTime");
			return (Criteria) this;
		}

		public Criteria andSendTimeNotIn(List<Date> values) {
			addCriterion("SEND_TIME not in", values, "sendTime");
			return (Criteria) this;
		}

		public Criteria andSendTimeBetween(Date value1, Date value2) {
			addCriterion("SEND_TIME between", value1, value2, "sendTime");
			return (Criteria) this;
		}

		public Criteria andSendTimeNotBetween(Date value1, Date value2) {
			addCriterion("SEND_TIME not between", value1, value2, "sendTime");
			return (Criteria) this;
		}
	}

	/**
	 * This class was generated by MyBatis Generator. This class corresponds to the database table message_info
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
     * This class corresponds to the database table message_info
     *
     * @mbg.generated do_not_delete_during_merge Sun May 06 20:50:13 CST 2018
     */
    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }
}