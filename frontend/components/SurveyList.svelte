<script lang="ts">
  import { createEventDispatcher } from "svelte"
  import type { Survey } from "../stores/surveysStore";

  export let surveyList: Survey[];
  let surveyIndex = 0;

  const dispatch = createEventDispatcher();

  /*
  async function fetchSurveys() {
    console.log('fetchSurveys')
    // TODO: remove
    // await postSurveys();

    try {
      const response = await surveys.get();
      const surveyList = JSON.parse(response).filter(survey => survey.title)
      if (Array.isArray(surveyList)) return surveyList;
    } catch (err) {
      surveyList = [];
      postSurveys();
      alert(err.message);
    }
    return [];
  }

  async function postSurveys() {
    try {
      console.log('post', surveyList)
      await surveys.set(JSON.stringify(surveyList, null, 2));
      surveyList = await fetchSurveys();
    } catch (err) {
      alert(err.message);
    }
  }

  function createSurvey() {
    newSurvey = JSON.parse(JSON.stringify(SURVEY_TEMPLATE));
  }

  function saveNewSurvey({detail}) {
    console.log('saveNewSurvey', detail)
    surveyList.push(detail);
    newSurvey = null;

    postSurveys();
  }
  */
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
