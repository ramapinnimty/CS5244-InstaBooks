<script setup lang="ts"></script>

<style scoped>
footer {
  background: var(--card-background-color);
  height: 10vh;
  width: 100vw;
  display: flex;
  justify-content: space-between;
}

.social-media-icons,
.links,
.copyright {
  display: flex;
  flex-direction: row;
  align-self: center;
}

.social-media-icons {
  gap: 0.75em;
}

footer i {
  color: black;
}

.links {
  gap: 0.25em;
}

footer .links a {
  color: black;
  text-decoration: underline;
}

.copyright {
  display: flex;
  flex-direction: row;
  gap: 0.25em;
}
</style>

<template>
  <footer class="container">
    <section class="social-media-icons">
      <router-link to="/">
        <i class="fa-brands fa-facebook-f fa-lg"></i>
      </router-link>
      <router-link to="/">
        <i class="fa-brands fa-instagram fa-lg"></i>
      </router-link>

      <router-link to="/">
        <i class="fa-brands fa-twitter fa-lg"></i>
      </router-link>
      <router-link to="/">
        <i class="fa-brands fa-tiktok fa-lg"></i>
      </router-link>
    </section>

    <section class="links">
      <router-link to="/"><strong>ABOUT</strong></router-link>
      <span> <strong>|</strong> </span>
      <router-link to="/"><strong>DIRECTIONS</strong></router-link>
      <span> <strong>|</strong> </span>
      <router-link to="/"><strong>CONTACT</strong></router-link>
    </section>

    <section class="copyright">
      <p>
        <span class="fa-regular fa-copyright"></span> 2022 All Rights Reserved.
      </p>
    </section>
  </footer>
</template>
