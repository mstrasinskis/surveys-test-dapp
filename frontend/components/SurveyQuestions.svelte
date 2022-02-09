<script>
  import { createEventDispatcher } from "svelte"

  export let survey;
  const dispatch = createEventDispatcher();

</script>

<form>
  <h1>{survey.title}</h1>
  <ul>
  {#each survey.questions as question}
    <li><input type="text" bind:value={question.question}></li>
  {/each}
  </ul>

  <button type="submit" on:click|preventDefault={() => dispatch('save', survey)}>Save Answers</button>
</form>

<style>
</style>
