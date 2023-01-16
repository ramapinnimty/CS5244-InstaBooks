import { defineStore } from "pinia";
import { CategoryItem } from "@/types";
import { apiUrl } from "@/services/ApiService";

export const useCategoryStore = defineStore("CategoryStore", {
  // State
  state: () => ({
    categoryList: [] as CategoryItem[],
  }),
  // Actions
  actions: {
    async fetchCategories() {
      // Fetch the categories
      const url = apiUrl + "categories/";
      this.categoryList = await fetch(url).then((response) => response.json());
    },
  },
  // Getters
});
