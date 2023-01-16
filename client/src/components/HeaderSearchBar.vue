<script setup lang="ts"></script>

<style scoped>
.title-and-search-bar {
  border-radius: 50%;
  display: flex;
  align-self: center;
}

.search-block {
  display: flex;
  flex-direction: row;
  justify-content: space-around;
}

.search-box {
  position: relative;
}

.search-bar {
  padding: 0.5em;
  border: none;
  border-radius: 2rem;
  width: 40vw;
  background: white;
}

.search-bar::placeholder {
  font-weight: bolder;
}

.fa-magnifying-glass {
  position: absolute;
  color: var(--primary-color);
  /*padding-left: 21em;*/
  right: 10px;
  top: 10px;
  cursor: pointer;
}
</style>

<template>
  <section class="title-and-search-bar">
    <form action="category.html" class="search-block">
      <div class="search-box">
        <input
          type="text"
          class="search-bar"
          placeholder="Search by Book, Author ..."
        />
        <i class="fa-solid fa-magnifying-glass"></i>
      </div>
    </form>
  </section>
</template>
