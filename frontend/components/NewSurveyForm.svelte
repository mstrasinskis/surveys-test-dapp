<script lang="ts">
  import { createEventDispatcher, onMount } from "svelte"
  import { Survey, SURVEY_TEMPLATE } from "../stores/surveysStore"
  
  let survey: Survey;
  const dispatch = createEventDispatcher();

  onMount(() => reset())

  const reset = () => {
    survey = JSON.parse(JSON.stringify(SURVEY_TEMPLATE));
  }

  const addQuestion = () => {
    survey = {...survey, questions: [...survey.questions, {question: ''}]}
  }

  const save = () => {
    dispatch('save', survey);
    reset();
  }
</script>

{#if survey}
<form>
    <h2>New Survey:</h2>
    <label>Survey Title: <input bind:value={survey.title}></label>
    <ul>
    {#each survey.questions as question, i}
        <li>
          <label>Question {i}.
            <input bind:value={question.question}>
          </label>
        </li>
    {/each}
    </ul>

    <button on:click|preventDefault={addQuestion}>Add a Question</button>
    <button type="submit" on:click|preventDefault={save}>Save in the IC</button>
  </form>
{/if}

<style>
</style>
