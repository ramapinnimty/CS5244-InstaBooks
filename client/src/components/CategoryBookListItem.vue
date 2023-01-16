<script setup lang="ts">
import { defineProps } from "vue";
import { BookItem } from "@/types";
import { useCartStore } from "@/stores/CartStore";

const cartStore = useCartStore();
const props = defineProps<{
  book: BookItem;
}>();
const bookImageFileName = function (book: BookItem): string {
  let name = book.title.toLowerCase();
  name = name.replace(/ /g, "-");
  name = name.replace(/'/g, "");
  return `${name}.gif`;
};
</script>
<style scoped>
#book-boxes {
  display: grid;
  grid-template-columns: repeat(auto-fit, 300px);
  gap: 3em 6em;
  justify-content: center;
  align-items: center;
  margin: 1.8rem 3rem;
}

.book-box {
  display: flex;
  flex-direction: row;
  background-color: var(--card-background-color);
  padding: 1em;
  position: relative;
  min-width: 350px;
}

.is-featured {
  background-color: var(--secondary-background-color);
}

.book-image img {
  height: 200px;
  width: 150px;
}

.read-button {
  position: absolute;
  top: 15px;
}

.read-button:hover,
.read-button:active {
  background-color: var(--primary-color-dark);
}

.book-data {
  display: flex;
  color: black;
  flex-direction: column;
  justify-content: space-evenly;
  padding-left: 1rem;
}

.book-title {
  font-weight: bold;
  font-size: larger;
}

.book-author {
  font-weight: lighter;
  font-style: italic;
}

.book-price {
  font-weight: bold;
}

.cart-button-box {
  display: flex;
  position: relative;
  color: var(--primary-color);
  align-items: center;
}

.button {
  background-color: var(--primary-color);
  width: 8em;
  border: none;
  border-radius: 0.25rem;
}

.cart-button {
  width: 3.5rem;
  text-align: center;
  padding-left: 2rem;
  margin-top: 0.2rem;
  border: none;
  background-color: var(--card-background-color);
  color: var(--primary-color);
}

.button.cart-button.categories:hover,
.button.cart-button.categories:active {
  background-color: var(--primary-color-dark);
}

.button.cart-button.categories {
  display: flex;
  align-items: center;
  width: 8em;
  font-size: small;
  padding: 0.65em;
  background: var(--primary-color);
  color: white;
  box-shadow: 0 10px 10px 0 rgb(0 0 0 / 25%);
}

.fa-cart-plus:before {
  margin: 0 5px 0 0;
}
</style>

<template>
  <ul id="book-boxes">
    <li class="book-box" :class="{ 'is-featured': book.isFeatured }">
      <div class="book-image">
        <img
          :src="require('@/assets/images/books/' + bookImageFileName(book))"
          :alt="book.title"
        />
      </div>

      <div class="read-button" v-if="book.isPublic">
        <button class="button">Read Now</button>
      </div>
      <div class="book-data">
        <div class="book-title">{{ book.title }}</div>
        <div class="book-author">{{ book.author }}</div>
        <div class="book-price">${{ (book.price / 100).toFixed(2) }}</div>
        <div class="cart-button-box">
          <button
            class="button cart-button categories"
            @click="cartStore.addToCart(book)"
          >
            <i class="fa-sharp fa-solid fa-cart-plus"></i> Add to Cart
          </button>
        </div>
      </div>
    </li>
  </ul>
</template>
