<script setup lang="ts">
import AppFetchCategories from "@/components/AppFetchCategories.vue";
</script>

<style>
#app {
  height: 100vh;
  width: 100vw;
  display: flex;
  flex-direction: column;
}
</style>

<template>
  <div id="app">
    <Suspense>
      <AppFetchCategories></AppFetchCategories>
    </Suspense>
  </div>
</template>
