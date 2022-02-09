<script lang="ts">
import { onMount } from "svelte";

import NewSurveyForm from "./components/NewSurveyForm.svelte";

  import SurveyList from "./components/SurveyList.svelte"
  import SurveyQuestions from "./components/SurveyQuestions.svelte";
  import { fetchSurveys, ICSurveysData, postSurveys, Survey } from "./stores/surveysStore";

  let surveyData: ICSurveysData = null;
  let selectedSurvey: Survey = null;

  onMount(async () => {
    refetch();
  })

  async function refetch() {
    surveyData = await fetchSurveys();
  }

  function save({detail}) {
    console.log('save', detail)
    surveyData.surveys.push(detail);
    postSurveys(surveyData);
  }

  function runSurvey({detail}) {
    const surveyIndex = detail;
    selectedSurvey = surveyData.surveys[surveyIndex];
  }
</script>

<pre>{JSON.stringify(surveyData, null, 2)}</pre>

<div class="App">
  <NewSurveyForm on:save={save} />
  <SurveyList surveyList={surveyData?.surveys} on:fetch={refetch} on:runSurvey={runSurvey} />
  {#if selectedSurvey}
    <SurveyQuestions survey={selectedSurvey} />
  {/if}
</div>

<style global>
  body {
    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", "Roboto",
      "Oxygen", "Ubuntu", "Cantarell", "Fira Sans", "Droid Sans",
      "Helvetica Neue", sans-serif;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
  }

  form {
    margin: 3rem;
    padding: 3rem;
    border: 0.5rem solid black;
  }

  label {
    display: block;
    padding: 0.4rem;
    font-size: 2rem;
    font-weight: 900;
  }

  input,
  button {
    padding: 0.4rem;
    background: white;
    border: 0.5rem solid black;
    font-size: 2rem;
    font-weight: 900;
  }

  button {
    cursor: pointer;
  }
  button:hover {
    background: black;
    color: white;
  }

  input:focus {
    background: black;
    color: white;
  }

  pre {
    padding: 1rem;
    background: black;
    color: white;
    font-size: .5rem;
  }
</style>
