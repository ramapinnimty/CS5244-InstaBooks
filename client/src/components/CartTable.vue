<script setup lang="ts">
import { useCartStore } from "@/stores/CartStore";
import { asDollarsAndCents } from "@/main";

const cartStore = useCartStore();
import { BookItem } from "@/types";
// const bookImageFileName = function (book: BookItem): string {
//   let name = book.title.toLowerCase();
//   name = name.replace(/ /g, "-");
//   name = name.replace(/'/g, "");
//   return `${name}.jpeg`;
// };
const bookImageFileName = function (book: BookItem): string {
  let name = book.title.toLowerCase();
  name = name.replace(/ /g, "-");
  name = name.replace(/'/g, "");
  return `${name}.gif`;
};
// TODO If necessary, replace the above function with the "bookImageFileName" function
//  TODO from your CategoryBookListItem component.

const updateCart = function (book: BookItem, quantity: number) {
  // cartStore.cart.update(book, quantity);
  cartStore.updateBookQuantity(book, quantity);
};
// TODO The above function calls through directly to the shopping cart, which means it does not update local storage.
// TODO Change the implementation so that it uses the appropriate action from the cart storage.
</script>

<style scoped>
.cart-table {
  display: grid;
  grid-template-columns: max-content minmax(10em, 20em) repeat(3, max-content);
  row-gap: 1em;
  width: fit-content;
  margin: 0 auto;
  background-color: var(--card-background-color);
}

ul {
  display: contents;
}

ul > li {
  display: contents;
}

.table-heading {
  background-color: var(--neutral-color);
  color: white;
}

.table-heading > * {
  background-color: var(--neutral-color);
  padding: 0.5em;
}

.heading-book {
  grid-column: 1 / 3;
}

.heading-price {
  grid-column: 3 / 5;
  text-align: right;
}

.heading-subtotal {
  text-align: right;
  grid-column: -2 / -1;
}

.cart-book-image {
  padding: 0 1em;
}

.cart-book-image > * {
  margin-left: auto;
  margin-right: 0;
}

img {
  display: block;
  width: 75px;
  height: 100px;
}
/* TODO The width above is for book images that are normally 200px wide. Change this (if necessary) */
/* TODO to accommodate your own book images. the rule of thumb is that the image here should be about */
/* TODO half the size of the book images as they appear on your category page. */

.cart-book-title {
  align-self: center;
}

.cart-book-price {
  padding-left: 1em;
  text-align: right;
  align-self: center;
}

.cart-book-quantity {
  padding-left: 1em;
  padding-right: 1em;
  align-self: center;
}

.cart-book-subtotal {
  text-align: right;
  padding-left: 1em;
  padding-right: 1em;
  align-self: center;
}

/* Row separators in the table */

.line-sep {
  display: block;
  height: 2px;
  background-color: gray;
  grid-column: 1 / -1;
}

/* Increment/decrement buttons */

/* TODO Consider using icon buttons for your increment and decrement buttons. */
/* TODO Modify the CSS here to suit your own design. */
/* TODO In particular, you may or may not have custom properties */
/* TODO primary-color and primary-color-dark defined in your global CSS file. */
.icon-button {
  border: none;
  cursor: pointer;
}

.inc-button {
  font-size: 1.125rem;
  color: #0277bd;
  margin-right: 0.25em;
  border: none;
  padding: 0.3em;
  box-shadow: 0px 5px 5px 0px rgba(0, 0, 0, 0.1);
}

.inc-button:hover {
  color: #01579b;
}

.dec-button {
  font-size: 1.125rem;
  color: #e64044;
  border: none;
  padding: 0.3em;
  box-shadow: 0px 5px 5px 0px rgba(0, 0, 0, 0.1);
}

.dec-button:hover {
  color: #c20121;
}

.quantity {
  padding: 0 10px;
}

select {
  background-color: var(--primary-color);
  color: white;
  border: 2px solid var(--primary-color-dark);
  border-radius: 3px;
}
</style>

<template>
  <div class="cart-table">
    <ul>
      <li class="table-heading">
        <div class="heading-book">Book</div>
        <div class="heading-price">Price / Quantity</div>
        <div class="heading-subtotal">Amount</div>
      </li>
      <template v-for="item in cartStore.cart.items" :key="item.book.bookId">
        <li>
          <div class="cart-book-image">
            <img
              :src="
                require('@/assets/images/books/' + bookImageFileName(item.book))
              "
              :alt="item.book.title"
              width="100px"
              height="auto"
            />
          </div>
          <div class="cart-book-title">{{ item.book.title }}</div>
          <div class="cart-book-price">
            ${{ (item.book.price / 100).toFixed(2) }}
          </div>
          <div class="cart-book-quantity">
            <button
              class="dec-button"
              @click="updateCart(item.book, item.quantity - 1)"
            >
              <i class="fa-solid fa-circle-minus"></i>
            </button>
            <span class="quantity">{{ item.quantity }}</span>
            <button
              class="inc-button"
              @click="updateCart(item.book, item.quantity + 1)"
            >
              <i class="fa-solid fa-circle-plus"></i>
            </button>
          </div>
          <div class="cart-book-subtotal">
            {{ asDollarsAndCents(item.quantity * item.book.price) }}
          </div>
        </li>
        <li class="line-sep"></li>
      </template>
    </ul>
  </div>
</template>
