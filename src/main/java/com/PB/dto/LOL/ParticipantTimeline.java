package com.PB.dto.LOL;

import java.util.Map;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ParticipantTimeline {
	private int participantId;
	private Map<String, Double> csDiffPerMinDeltas;
	private Map<String, Double> damageTakenPerMinDeltas;
	private String role;
	private Map<String, Double> damageTakenDiffPerMinDeltas;
	private Map<String, Double> xpPerMinDeltas;
	private Map<String, Double> xpDiffPerMinDeltas;
	private String lane;
	private Map<String, Double> creepsPerMinDeltas;
	private Map<String, Double> goldPerMinDeltas;
}	