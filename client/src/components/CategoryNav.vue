<script setup lang="ts">
import { useRoute } from "vue-router";
import { useCategoryStore } from "@/stores/CategoryStore";
import { useCartStore } from "@/stores/CartStore";

const cartStore = useCartStore();
const setCurrentCategoryName = function (categoryName: string) {
  cartStore.selectedCategoryName = categoryName;
};

const route = useRoute();
const categoryStore = useCategoryStore();
</script>

<style scoped>
.category-nav {
  width: 100vw;
}

.category-buttons {
  display: flex;
  flex-direction: row;
  text-align: center;
  background-color: var(--neutral-color);
}

.button.selected-category-button {
  background-color: var(--primary-color);
  padding: 0.75em 0;
  width: 25vw;
  font-weight: bold;
  border-left: solid black;
}

.button.selected-category-button:hover {
  background-color: var(--primary-color-dark);
}

.button.unselected-category-button {
  padding: 0.75em 0;
  width: 25vw;
  font-weight: bold;
  border-left: solid black;
}

.button.unselected-category-button,
.button.unselected-category-button:visited {
  background-color: var(--neutral-color);
}

.button.unselected-category-button:hover,
.button.unselected-category-button:active {
  background-color: var(--primary-color);
}

.button.unselected-category-button:hover {
  opacity: 0.7;
}
</style>

<template>
  <nav class="category-nav">
    <ul class="category-buttons">
      <li
        v-for="category in categoryStore.categoryList"
        :key="category.categoryId"
        @click="setCurrentCategoryName(category.name)"
      >
        <router-link
          :to="{ name: 'category-view', params: { name: category.name } }"
          class="button"
          :class="
            category.name === route.params.name
              ? 'selected-category-button'
              : 'unselected-category-button'
          "
        >
          {{ category.name }}
        </router-link>
      </li>
    </ul>
  </nav>
</template>
