<script setup lang="ts">
import { useCategoryStore } from "@/stores/CategoryStore";
import { useCartStore } from "@/stores/CartStore";

const cartStore = useCartStore();
const setCurrentCategoryName = function (categoryName: string) {
  cartStore.selectedCategoryName = categoryName;
};
const categoryStore = useCategoryStore();
</script>

<style scoped>
.header-dropdown {
  position: relative;
}

.categories-button {
  background-color: var(--primary-color);
  margin-top: 0.25em;
  box-shadow: 0px 10px 10px 0px rgba(0, 0, 0, 0.25);
  display: flex;
  align-items: center;
  padding: 0.5em 1em;
  color: white;
  width: 8em;
  border: none;
  border-radius: 0.25rem;
  cursor: pointer;
}

.categories-button:hover,
.categories-button:active {
  background-color: var(--primary-color-dark);
}

.header-dropdown ul {
  background-color: var(--secondary-background-color);
  color: black;
  display: none;
  border-radius: 5%;
}

.header-dropdown:hover ul {
  display: block;
  position: absolute;
  min-width: 8em;
  z-index: 1;
  cursor: pointer;
}

.header-dropdown li {
  min-width: max-content;
  padding: 1px 0 1px 3px;
}

.header-dropdown li:hover {
  background: var(--primary-color-dark);
  opacity: 0.7;
}

.header-dropdown a {
  display: block;
  color: black;
  text-decoration: none;
  padding: 0 3.5em 0 0;
  font-size: large;
  font-weight: lighter;
}

.fa-caret-down {
  position: absolute;
  right: 0.75em;
  top: 0.8em;
  color: white;
  align-self: center;
}

.dropdown_menu {
  animation: growDown 300ms ease-in-out forwards;
  transform-origin: top center;
}

@keyframes growDown {
  0% {
    transform: scaleY(0);
  }
  80% {
    transform: scaleY(1.1);
  }
  100% {
    transform: scaleY(1);
  }
}
</style>

<template>
  <div class="header-dropdown">
    <button class="categories-button">
      Categories<i class="fa-solid fa-caret-down"></i>
    </button>
    <ul class="dropdown_menu">
      <li
        v-for="category in categoryStore.categoryList"
        :key="category.categoryId"
      >
        <router-link
          :to="'../category/' + category.name"
          @click="setCurrentCategoryName(category.name)"
        >
          {{ category.name }}
        </router-link>
      </li>
    </ul>
  </div>
</template>
