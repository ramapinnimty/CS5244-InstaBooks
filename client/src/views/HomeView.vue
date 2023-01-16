<script setup lang="ts">
// import HomeCategoryList from "@/components/HomeCategoryList.vue";
</script>

<style scoped>
.hero-image {
  height: 95vh;
  width: 100vw;
  background: url(../assets/images/site/bookstore-background.jpeg);
  background-repeat: no-repeat;
  background-size: cover;
  background-position: center;
}

.welcome-text {
  display: flex;
  flex-direction: column;
  color: black;
}

.title-welcome {
  font-size: 25px;
  font-weight: lighter;
  font-family: "Roboto";
  color: black;
}

.hero-image > div {
  margin-top: 15vh;
  margin-left: 75vw;
}

.button {
  background-color: #ff7518;
  width: 8em;
  border: none;
  border-radius: 0.25rem;
}

.cta-button {
  position: relative;
  /*align-self: center;*/
}

.cta-btn {
  width: 10rem;
  text-align: center;
  font-weight: bold;
  font-size: large;
  border: none;
  border-radius: 0.25rem;
  background-color: #ff7518;
  color: #f9f9f3;
  height: 2.5rem;
  padding-left: 0.4rem;
  box-shadow: 0px 10px 10px 0px rgba(0, 0, 0, 0.25);
}

.cta-btn:hover,
.cta-btn:active {
  background: var(--primary-color-dark);
}
</style>

<template>
  <div class="hero-image">
    <div class="welcome-text">
      <div class="title-welcome">
        <em>EASY... FAST... AFFORDABLE...</em>
      </div>
      <br />
      <div>The books you need, just a <strong>few clicks</strong> away...</div>
      <br />
      <div class="cta-button">
        <router-link :to="'../category/Sci-Fi'">
          <button class="button cta-btn">SHOP NOW!</button>
        </router-link>
      </div>
    </div>
  </div>
</template>
