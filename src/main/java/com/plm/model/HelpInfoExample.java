package com.plm.model;

import java.util.ArrayList;
import java.util.List;

public class HelpInfoExample {
    /**
	 * This field was generated by MyBatis Generator. This field corresponds to the database table help_info
	 * @mbg.generated  Tue May 15 22:59:52 CST 2018
	 */
	protected String orderByClause;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database table help_info
	 * @mbg.generated  Tue May 15 22:59:52 CST 2018
	 */
	protected boolean distinct;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database table help_info
	 * @mbg.generated  Tue May 15 22:59:52 CST 2018
	 */
	protected List<Criteria> oredCriteria;

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table help_info
	 * @mbg.generated  Tue May 15 22:59:52 CST 2018
	 */
	public HelpInfoExample() {
		oredCriteria = new ArrayList<Criteria>();
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table help_info
	 * @mbg.generated  Tue May 15 22:59:52 CST 2018
	 */
	public void setOrderByClause(String orderByClause) {
		this.orderByClause = orderByClause;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table help_info
	 * @mbg.generated  Tue May 15 22:59:52 CST 2018
	 */
	public String getOrderByClause() {
		return orderByClause;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table help_info
	 * @mbg.generated  Tue May 15 22:59:52 CST 2018
	 */
	public void setDistinct(boolean distinct) {
		this.distinct = distinct;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table help_info
	 * @mbg.generated  Tue May 15 22:59:52 CST 2018
	 */
	public boolean isDistinct() {
		return distinct;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table help_info
	 * @mbg.generated  Tue May 15 22:59:52 CST 2018
	 */
	public List<Criteria> getOredCriteria() {
		return oredCriteria;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table help_info
	 * @mbg.generated  Tue May 15 22:59:52 CST 2018
	 */
	public void or(Criteria criteria) {
		oredCriteria.add(criteria);
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table help_info
	 * @mbg.generated  Tue May 15 22:59:52 CST 2018
	 */
	public Criteria or() {
		Criteria criteria = createCriteriaInternal();
		oredCriteria.add(criteria);
		return criteria;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table help_info
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
	 * This method was generated by MyBatis Generator. This method corresponds to the database table help_info
	 * @mbg.generated  Tue May 15 22:59:52 CST 2018
	 */
	protected Criteria createCriteriaInternal() {
		Criteria criteria = new Criteria();
		return criteria;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table help_info
	 * @mbg.generated  Tue May 15 22:59:52 CST 2018
	 */
	public void clear() {
		oredCriteria.clear();
		orderByClause = null;
		distinct = false;
	}

	/**
	 * This class was generated by MyBatis Generator. This class corresponds to the database table help_info
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

		public Criteria andHIdIsNull() {
			addCriterion("H_ID is null");
			return (Criteria) this;
		}

		public Criteria andHIdIsNotNull() {
			addCriterion("H_ID is not null");
			return (Criteria) this;
		}

		public Criteria andHIdEqualTo(Integer value) {
			addCriterion("H_ID =", value, "hId");
			return (Criteria) this;
		}

		public Criteria andHIdNotEqualTo(Integer value) {
			addCriterion("H_ID <>", value, "hId");
			return (Criteria) this;
		}

		public Criteria andHIdGreaterThan(Integer value) {
			addCriterion("H_ID >", value, "hId");
			return (Criteria) this;
		}

		public Criteria andHIdGreaterThanOrEqualTo(Integer value) {
			addCriterion("H_ID >=", value, "hId");
			return (Criteria) this;
		}

		public Criteria andHIdLessThan(Integer value) {
			addCriterion("H_ID <", value, "hId");
			return (Criteria) this;
		}

		public Criteria andHIdLessThanOrEqualTo(Integer value) {
			addCriterion("H_ID <=", value, "hId");
			return (Criteria) this;
		}

		public Criteria andHIdIn(List<Integer> values) {
			addCriterion("H_ID in", values, "hId");
			return (Criteria) this;
		}

		public Criteria andHIdNotIn(List<Integer> values) {
			addCriterion("H_ID not in", values, "hId");
			return (Criteria) this;
		}

		public Criteria andHIdBetween(Integer value1, Integer value2) {
			addCriterion("H_ID between", value1, value2, "hId");
			return (Criteria) this;
		}

		public Criteria andHIdNotBetween(Integer value1, Integer value2) {
			addCriterion("H_ID not between", value1, value2, "hId");
			return (Criteria) this;
		}

		public Criteria andHTitleIsNull() {
			addCriterion("H_TITLE is null");
			return (Criteria) this;
		}

		public Criteria andHTitleIsNotNull() {
			addCriterion("H_TITLE is not null");
			return (Criteria) this;
		}

		public Criteria andHTitleEqualTo(String value) {
			addCriterion("H_TITLE =", value, "hTitle");
			return (Criteria) this;
		}

		public Criteria andHTitleNotEqualTo(String value) {
			addCriterion("H_TITLE <>", value, "hTitle");
			return (Criteria) this;
		}

		public Criteria andHTitleGreaterThan(String value) {
			addCriterion("H_TITLE >", value, "hTitle");
			return (Criteria) this;
		}

		public Criteria andHTitleGreaterThanOrEqualTo(String value) {
			addCriterion("H_TITLE >=", value, "hTitle");
			return (Criteria) this;
		}

		public Criteria andHTitleLessThan(String value) {
			addCriterion("H_TITLE <", value, "hTitle");
			return (Criteria) this;
		}

		public Criteria andHTitleLessThanOrEqualTo(String value) {
			addCriterion("H_TITLE <=", value, "hTitle");
			return (Criteria) this;
		}

		public Criteria andHTitleLike(String value) {
			addCriterion("H_TITLE like", value, "hTitle");
			return (Criteria) this;
		}

		public Criteria andHTitleNotLike(String value) {
			addCriterion("H_TITLE not like", value, "hTitle");
			return (Criteria) this;
		}

		public Criteria andHTitleIn(List<String> values) {
			addCriterion("H_TITLE in", values, "hTitle");
			return (Criteria) this;
		}

		public Criteria andHTitleNotIn(List<String> values) {
			addCriterion("H_TITLE not in", values, "hTitle");
			return (Criteria) this;
		}

		public Criteria andHTitleBetween(String value1, String value2) {
			addCriterion("H_TITLE between", value1, value2, "hTitle");
			return (Criteria) this;
		}

		public Criteria andHTitleNotBetween(String value1, String value2) {
			addCriterion("H_TITLE not between", value1, value2, "hTitle");
			return (Criteria) this;
		}

		public Criteria andHTypeIsNull() {
			addCriterion("H_TYPE is null");
			return (Criteria) this;
		}

		public Criteria andHTypeIsNotNull() {
			addCriterion("H_TYPE is not null");
			return (Criteria) this;
		}

		public Criteria andHTypeEqualTo(String value) {
			addCriterion("H_TYPE =", value, "hType");
			return (Criteria) this;
		}

		public Criteria andHTypeNotEqualTo(String value) {
			addCriterion("H_TYPE <>", value, "hType");
			return (Criteria) this;
		}

		public Criteria andHTypeGreaterThan(String value) {
			addCriterion("H_TYPE >", value, "hType");
			return (Criteria) this;
		}

		public Criteria andHTypeGreaterThanOrEqualTo(String value) {
			addCriterion("H_TYPE >=", value, "hType");
			return (Criteria) this;
		}

		public Criteria andHTypeLessThan(String value) {
			addCriterion("H_TYPE <", value, "hType");
			return (Criteria) this;
		}

		public Criteria andHTypeLessThanOrEqualTo(String value) {
			addCriterion("H_TYPE <=", value, "hType");
			return (Criteria) this;
		}

		public Criteria andHTypeLike(String value) {
			addCriterion("H_TYPE like", value, "hType");
			return (Criteria) this;
		}

		public Criteria andHTypeNotLike(String value) {
			addCriterion("H_TYPE not like", value, "hType");
			return (Criteria) this;
		}

		public Criteria andHTypeIn(List<String> values) {
			addCriterion("H_TYPE in", values, "hType");
			return (Criteria) this;
		}

		public Criteria andHTypeNotIn(List<String> values) {
			addCriterion("H_TYPE not in", values, "hType");
			return (Criteria) this;
		}

		public Criteria andHTypeBetween(String value1, String value2) {
			addCriterion("H_TYPE between", value1, value2, "hType");
			return (Criteria) this;
		}

		public Criteria andHTypeNotBetween(String value1, String value2) {
			addCriterion("H_TYPE not between", value1, value2, "hType");
			return (Criteria) this;
		}

		public Criteria andHContentIsNull() {
			addCriterion("H_CONTENT is null");
			return (Criteria) this;
		}

		public Criteria andHContentIsNotNull() {
			addCriterion("H_CONTENT is not null");
			return (Criteria) this;
		}

		public Criteria andHContentEqualTo(String value) {
			addCriterion("H_CONTENT =", value, "hContent");
			return (Criteria) this;
		}

		public Criteria andHContentNotEqualTo(String value) {
			addCriterion("H_CONTENT <>", value, "hContent");
			return (Criteria) this;
		}

		public Criteria andHContentGreaterThan(String value) {
			addCriterion("H_CONTENT >", value, "hContent");
			return (Criteria) this;
		}

		public Criteria andHContentGreaterThanOrEqualTo(String value) {
			addCriterion("H_CONTENT >=", value, "hContent");
			return (Criteria) this;
		}

		public Criteria andHContentLessThan(String value) {
			addCriterion("H_CONTENT <", value, "hContent");
			return (Criteria) this;
		}

		public Criteria andHContentLessThanOrEqualTo(String value) {
			addCriterion("H_CONTENT <=", value, "hContent");
			return (Criteria) this;
		}

		public Criteria andHContentLike(String value) {
			addCriterion("H_CONTENT like", value, "hContent");
			return (Criteria) this;
		}

		public Criteria andHContentNotLike(String value) {
			addCriterion("H_CONTENT not like", value, "hContent");
			return (Criteria) this;
		}

		public Criteria andHContentIn(List<String> values) {
			addCriterion("H_CONTENT in", values, "hContent");
			return (Criteria) this;
		}

		public Criteria andHContentNotIn(List<String> values) {
			addCriterion("H_CONTENT not in", values, "hContent");
			return (Criteria) this;
		}

		public Criteria andHContentBetween(String value1, String value2) {
			addCriterion("H_CONTENT between", value1, value2, "hContent");
			return (Criteria) this;
		}

		public Criteria andHContentNotBetween(String value1, String value2) {
			addCriterion("H_CONTENT not between", value1, value2, "hContent");
			return (Criteria) this;
		}
	}

	/**
	 * This class was generated by MyBatis Generator. This class corresponds to the database table help_info
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
     * This class corresponds to the database table help_info
     *
     * @mbg.generated do_not_delete_during_merge Sun May 06 20:50:13 CST 2018
     */
    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }
}