<script setup lang="ts">
import { useBookStore } from "@/stores/BookStore";
import CategoryBookListItem from "@/components/CategoryBookListItem.vue";

const bookStore = useBookStore();
</script>

<style scoped>
ul {
  display: grid;
  grid-template-columns: repeat(auto-fit, 300px);
  gap: 1em 8em;
  justify-content: center;
  align-items: center;
  margin: 0 3rem;
}
</style>

<template>
  <ul>
    <template v-for="book in bookStore.bookList" :key="book.bookId">
      <category-book-list-item :book="book"></category-book-list-item>
    </template>
  </ul>
</template>
