<script setup lang="ts">
import HeaderDropdown from "@/components/HeaderDropdown.vue";
import HeaderSearchBar from "@/components/HeaderSearchBar.vue";
import { useCartStore } from "@/stores/CartStore";

const cartStore = useCartStore();
</script>

<style scoped>
header {
  background: var(--card-background-color);
  width: 100vw;
  display: flex;
  justify-content: space-around;
}

a {
  text-decoration: none;
}

.logo-block {
  display: flex;
  flex-direction: row;
  width: 14vw;
  justify-content: space-around;
  align-self: center;
}

.logo {
  display: flex;
  align-self: center;
  height: max-content;
  width: max-content;
}

img {
  width: 50px;
  height: auto;
}

.text-logo {
  font-family: var(--title-font-family);
  color: var(--primary-color);
  font-weight: bolder;
  padding-top: 10px;
  padding-bottom: 10px;
}

.button {
  border: none;
}

.cart-button,
.cart-button:visited {
  display: inline-block;
  background-color: var(--card-background-color);
  color: var(--primary-color);
  border: none;
  cursor: pointer;
  opacity: 0.85;
  font-size: 19px;
  padding: 1px;
}

.cart-button:hover,
.cart-button:active {
  background-color: var(--card-background-color);
  color: var(--primary-color-dark);
}

.cart-button-box {
  position: relative;
}

.header-dropdown-and-cart {
  display: flex;
  flex-direction: row;
  width: 15vw;
  justify-content: space-around;
}

.header-dropdown-and-cart a {
  display: flex;
  align-items: center;
}

.cart-button-box {
  display: flex;
  position: relative;
  color: var(--primary-color);
  align-items: center;
}

.badge {
  font-size: 15px;
  color: #fff;
  background: var(--primary-color);
  border-radius: 50%;
  padding: 2.5px 5px;
  position: relative;
  left: -5px;
  top: -10px;
  opacity: 0.8;
}

.login-button {
  border: none;
  background-color: var(--card-background-color);
  color: var(--primary-color);
}

.login-button:hover,
.login-button:active {
  background-color: var(--card-background-color);
  color: var(--primary-color-dark);
}

.badge:hover,
.badge:active {
  background-color: var(--primary-color-dark);
  color: #f9f9f3;
}

.user-button-box {
  position: relative;
}

header > .login-button {
  color: var(--primary-color);
}

@media (max-width: 600px) {
  header {
    flex-direction: column;
  }
}
</style>

<template>
  <header class="container">
    <section class="bookstore-logo">
      <div class="logo-block">
        <router-link to="/" class="logo">
          <img :src="require('@/assets/images/site/instabooks-logo.png')" />
        </router-link>
        <router-link to="/">
          <h1 class="text-logo">
            <span style="color: black">I</span>nsta<span style="color: black"
              >B</span
            >ooks
          </h1>
        </router-link>
      </div>
    </section>
    <header-dropdown></header-dropdown>
    <header-search-bar></header-search-bar>
    <section class="header-dropdown-and-cart">
      <router-link to="/cart">
        <div class="cart-button-box">
          <button class="cart-button">
            <i class="fa fa-solid fa-shopping-cart fa-lg"></i>
            <span class="badge">{{ cartStore.count }}</span>
          </button>
        </div>
      </router-link>

      <div class="user-button-box">
        <button class="button login-button">
          <i class="fa-solid fa-user fa-lg"></i>
          <br />
          <span><strong>Rama</strong></span>
        </button>
      </div>
    </section>
  </header>
</template>
