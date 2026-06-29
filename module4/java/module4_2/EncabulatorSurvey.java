package module4_2;

import java.io.Serializable;

import javax.ejb.Stateful;

/*
 * CSD430: Server Side Development
 * Module 4: Java Beans
 *   Assignment 2: Programming Assignment
 * Isaac Ellingson
 * 6/28/2026
 *
 * Main assignment notes in results.jsp
 * 
 * This is just a fairly straightforward session data container.
 */

/**
 * Represents the sanitized results of a Turbo Encabulator Survey
 */
@Stateful
public class EncabulatorSurvey implements Serializable {
	private static final long serialVersionUID = 3863880089092387551L;
	
	private boolean wasCurrentSupplied = false;
	private int grammeterSyncRating = 1;
	private int semiBoloidSlotCount = 3;
	private String spurvingBearingAlignment = "";
	private SideFumblingCategory sideFumbling = SideFumblingCategory.NONE;
	
	
	// ### Accessors ###
	
	/** Returns true if the customer reported that sufficient inverse reactive current was supplied to their unilateral phase detractor */
	public boolean wasCurrentSupplied() { return wasCurrentSupplied; }
	/** Returns the level of synchronization the user reported in their cardinal grammeters, from 1..5 inclusive. */
	public int getGrammeterSyncRating() { return grammeterSyncRating; }
	/** Returns the number of semi-boloid slots the user reported in their turbo encabulator. Must be odd. */
	public int getSemiBoloidSlotCount() { return semiBoloidSlotCount; }
	/** Returns the user's remarks about the alignment of their spurving bearings. */
	public String getSpurvingBearingAlignment() { return spurvingBearingAlignment; }
	/** Returns the kind of side-fumbling the user reported, or NONE if side-fumbling was effectively prevented. */
	public SideFumblingCategory getSideFumblingCategory() { return sideFumbling; }
	
	
	// ### Mutators ###
	
	/** Sets whether inverse reactive current was adequately supplied. */
	public void setCurrentSupplied(boolean currentSupplied) {
		wasCurrentSupplied = currentSupplied;
	}
	
	/** Sets the user's reported synchronization level for their cardinal grammeters. Must be between 1 and 5, inclusive. */
	public void setGrammeterSyncRating(int rating) {
		if (rating<1 || rating > 5) throw new IllegalArgumentException("Sync ratings must be between 1 and 5, inclusive!");
		grammeterSyncRating = rating;
	}
	
	/** Sets the number of semi-boloid slots the user reported. Must be an odd number. */
	public void setSemiBoloidSlotCount(int slotCount) {
		if (slotCount % 2 == 0) throw new IllegalArgumentException("A Turbo Encabulator has an odd number of semi-boloid slots!");
		semiBoloidSlotCount = slotCount;
	}
	
	/** Sets the user's remarks about their spurving bearing alignment. */
	public void setSpurvingBearingAlignment(String remarks) {
		//Note: While the remarks will be briefly HTML-escaped, more work is needed here.
		spurvingBearingAlignment = remarks.replaceAll("&", "&amp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;");;
	}
	
	/** Sets the kind of side-fumbling the user reports experiencing. */
	public void setSideFumblingCategory(SideFumblingCategory category) {
		sideFumbling = category;
	}
	
	
	
	
	/**
	 * Represents a kind of side-fumbling issue reported in the survey.
	 */
	public static enum SideFumblingCategory {
		/** Side-fumbling was effectively prevented */
		NONE("nowhere"),
		/** Side-fumbling was observed around the waneshaft. */
		WANESHAFT("around the waneshaft"),
		/** Side-fumbling was observed across the hydrocoptic marzlevanes */
		MARZLEVANES("across the hydrocoptic marzlevanes"),
		/** Side-fumbling was observed only when the waneshaft is in non-ambifacent mode. */
		NON_AMBIFACENT("only when the waneshaft is in non-ambifacent mode");
		
		private final String description;
		SideFumblingCategory(String description) {
			this.description = description;
		}
		
		/** Gets a description of this kind of side-fumbling, such as "around the waneshaft". */
		public String getDescription() { return description; }
		
		/**
		 * Parses web-form input and returns a SideFumblingCategory.
		 * @param input The data returned from the web form
		 * @return A SideFumblingCategory corresponding to that form selection, or NONE if no corresponding category is available.
		 */
		public static SideFumblingCategory fromInput(String input) {
			return switch(input) {
			case "no" -> NONE;
			case "waneshaft" -> WANESHAFT;
			case "marzlevanes" -> MARZLEVANES;
			case "ambifacent" -> NON_AMBIFACENT;
			default -> NONE;
			};
		}
	}
}
