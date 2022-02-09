<script lang="ts">
  import { createEventDispatcher } from "svelte"
  import type { Survey } from "../stores/surveysStore";

  export let surveyList: Survey[];
  let surveyIndex = 0;

  const dispatch = createEventDispatcher();

</script>

<form>
  <h2>Existing survey:</h2>
  <button on:click|preventDefault={() => dispatch('fetch')}>List from the IC</button>
  {#if surveyList}
    {#each surveyList as survey, i}
    <br>
    <label>
      <input type="radio" bind:group={surveyIndex} name="survey" value={i} >
      {survey.title}
    </label>
    {/each}
    <button on:click|preventDefault={() => dispatch('runSurvey', surveyIndex)}>Run Survey</button>
  {/if}
</form>

<style>
</style>
