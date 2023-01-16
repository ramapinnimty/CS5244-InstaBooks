<script setup lang="ts">
import { reactive } from "vue";
import useVuelidate from "@vuelidate/core";
import {
  email,
  helpers,
  maxLength,
  minLength,
  required,
} from "@vuelidate/validators";
import { useCartStore } from "@/stores/CartStore";
import { isCreditCard, isMobilePhone } from "@/utils";
import CheckoutFieldError from "@/components/CheckoutFieldError.vue";
import router from "@/router";
import { asDollarsAndCents } from "@/main";

const cartStore = useCartStore();
const cart = cartStore.cart;

const months: string[] = [
  "January",
  "February",
  "March",
  "April",
  "May",
  "June",
  "July",
  "August",
  "September",
  "October",
  "November",
  "December",
];

function generateYears() {
  // Get current year
  const today = new Date();
  const currentYear = today.getFullYear();
  const years = [currentYear];
  // Get next 15 years
  for (let i = 1; i <= 15; i++) {
    years.push(currentYear + i);
  }
  return years;
}
const years: number[] = generateYears();

const form = reactive({
  name: "",
  address: "",
  phone: "",
  email: "",
  ccNumber: "",
  ccExpiryMonth: new Date().getMonth() + 1,
  ccExpiryYear: new Date().getFullYear(),
  checkoutStatus: "",
});

const rules = {
  name: {
    required: helpers.withMessage("Please provide a name.", required),
    minLength: helpers.withMessage(
      "Name must have at least 4 letters.",
      minLength(4)
    ),
    maxLength: helpers.withMessage(
      "Name can have at most 45 letters.",
      maxLength(45)
    ),
  },
  //   TODO: Add more validations for these and other fields that need more validation.
  address: {
    required: helpers.withMessage("Please provide an address.", required),
    minLength: helpers.withMessage(
      "Address must have at least 4 characters.",
      minLength(4)
    ),
    maxLength: helpers.withMessage(
      "Address can have at most 45 characters.",
      maxLength(45)
    ),
  },
  email: {
    required: helpers.withMessage("Please provide an email-id.", required),
    email: email,
  },
  phone: {
    required: helpers.withMessage("Please provide a phone number.", required),
    phone: helpers.withMessage(
      "Please provide a valid phone number.",
      (value: string) => !helpers.req(value) || isMobilePhone(value)
    ),
  },
  ccNumber: {
    required: helpers.withMessage(
      "Please provide a credit card number.",
      required
    ),
    ccNumber: helpers.withMessage(
      "Please provide a valid credit card number.",
      (value: string) => !helpers.req(value) || isCreditCard(value)
    ),
  },
  ccExpiryMonth: {},
  ccExpiryYear: {},
};

const $v = useVuelidate(rules, form);

async function submitOrder() {
  console.log("Submit order");
  const isFormCorrect = await $v.value.$validate();
  if (!isFormCorrect) {
    form.checkoutStatus = "ERROR";
  } else {
    form.checkoutStatus = "PENDING";
    await cartStore
      .placeOrder({
        name: form.name,
        address: form.address,
        phone: form.phone,
        email: form.email,
        ccNumber: form.ccNumber,
        ccExpiryMonth: form.ccExpiryMonth,
        ccExpiryYear: form.ccExpiryYear,
      })
      .then(() => {
        form.checkoutStatus = "OK";
        cartStore.clearCart();
        router.push({ name: "confirmation-view" });
      })
      .catch((reason) => {
        form.checkoutStatus = "SERVER_ERROR";
        console.log("Error placing order", reason);
      });
  }
}

/* NOTE: For example yearFrom(0) == <current_year> */
function yearFrom(index: number) {
  return new Date().getFullYear() + index;
}
</script>

<style scoped>
/* TODO: Adapt these styles to your page */
.checkout-page {
  width: 100vw;
  /*height: 80%;*/
  background: white;
  color: var(--neutral-color);
}

.checkout-page-body {
  display: flex;
  /*align-items: center;*/
  justify-content: space-between;
  width: 100vw;
  /*height: 80%;*/
  padding: 1em;
  padding: 2em 6em;
}

form {
  width: 45vw;
  height: min-content;
  display: flex;
  flex-direction: column;
  align-items: center;
  background-color: var(--card-background-color);
  border-radius: 3%;
  padding: 1em 1em 2em 1em;
  box-shadow: 0px 5px 5px 0px rgba(0, 0, 0, 0.1);
}

form > div {
  display: flex;
  justify-content: flex-end;
  margin-bottom: 0.5em;
}

form > div > input {
  width: 40vw;
  height: 4vh;
}

form > div > input,
form > div > select {
  background-color: white;
  /*margin-left: 0.5em;*/
  border-style: none;
  border-radius: 5px;
}

.error {
  color: red;
  font-weight: lighter;
  font-style: italic;
}

form > div > label {
  font-size: large;
  font-weight: 500;
  color: var(--neutral-color);
}

.checkoutStatusBox {
  /*margin: 1em;*/
  /*padding: 1em;*/
  text-align: center;
}

.empty-checkout-page {
  margin: 1em auto;
  text-align: center;
}
.ccMonthYear {
  display: flex;
  width: 40vw;
  height: 4vh;
  align-content: space-between;
}

.ccMonthYeargap {
  width: 1em;
}

.ccMonth > select {
  border-style: none;
  border-radius: 5px;
  height: 4vh;
}

.ccYear > select {
  border-style: none;
  border-radius: 5px;
  height: 4vh;
}

.sameLevel {
  display: flex;
  flex-direction: column;
  /*padding: 0 1em;*/
}

.inputs {
  margin: 0.75em;
}

.order-summary-card {
  height: min-content;
  background-color: var(--card-background-color);
  color: var(--neutral-color);
  border-radius: 3%;
  padding: 1em 2em 1em 0.5em;
  box-shadow: 0px 5px 5px 0px rgba(0, 0, 0, 0.1);
}

.order-summary-card > p {
  display: flex;
  justify-content: space-between;
  font-size: large;
  margin: 0.5em;
}

.right {
  padding-left: 3em;
  text-align: right;
}

.special {
  font-weight: bolder;
}

.checkout-btn {
  width: 30vw;
  height: 2.25rem;
  text-align: center;
  font-size: medium;
  font-weight: bold;
  border: none;
  border-radius: 0.5rem;
  color: #f9f9f3;
  background-color: var(--primary-color);
  margin-top: 2em;
  cursor: pointer;
  box-shadow: 0px 5px 5px 0px rgba(0, 0, 0, 0.25);
}

.checkout-btn:hover,
.checkout-btn:active {
  background-color: var(--primary-color-dark);
  color: #f9f9f3;
  border: none;
}

.pending {
  font-weight: bolder;
  color: #cc7722;
}

.success {
  font-weight: bolder;
  color: darkgreen;
}

.center {
  display: flex;
  justify-content: center;
  align-items: center;
  margin: 1em auto;
}

.continue-btn {
  width: auto;
  height: 2.25rem;
  text-align: center;
  font-size: small;
  font-weight: lighter;
  border: thin solid #ff7518;
  border-radius: 0.5rem;
  color: #ff7518;
  background-color: #f9f9f3;
  cursor: pointer;
  box-shadow: 0px 5px 5px 0px rgba(0, 0, 0, 0.25);
}

.continue-btn:hover,
.continue-btn:active {
  background-color: #ff7518;
  color: #f9f9f3;
  border: none;
}
</style>

<template>
  <div class="checkout-page">
    <section class="checkout-page-body" v-if="!cart.empty">
      <form @submit.prevent="submitOrder">
        <div class="sameLevel inputs">
          <label for="name">Full Name</label>
          <input
            type="text"
            size="20"
            id="name"
            name="name"
            v-model.lazy="$v.name.$model"
          />
          <span class="error">
            <CheckoutFieldError field-name="name" :validator="$v">
            </CheckoutFieldError>
          </span>
        </div>
        <!--        <template v-if="$v.name.$error">-->
        <!--          <span class="error" v-for="error of $v.name.$errors" :key="error.$uid"-->
        <!--            >{{ error.$message }}-->
        <!--          </span>-->
        <!--        </template>-->
        <!-- TODO: Add address input and validation messages -->
        <div class="sameLevel inputs">
          <label for="address">Address</label>
          <input
            type="text"
            size="20"
            id="address"
            name="address"
            v-model.lazy="$v.address.$model"
          />
          <span class="error">
            <CheckoutFieldError field-name="address" :validator="$v">
            </CheckoutFieldError>
          </span>
        </div>
        <!--        <template v-if="$v.address.$error">-->
        <!--          <span-->
        <!--            class="error"-->
        <!--            v-for="error of $v.address.$errors"-->
        <!--            :key="error.$uid"-->
        <!--            >{{ error.$message }}-->
        <!--          </span>-->
        <!--        </template>-->
        <div class="sameLevel inputs">
          <label for="phone">Phone Number</label>
          <input
            class="textField"
            type="text"
            id="phone"
            name="phone"
            v-model.lazy="$v.phone.$model"
          />
          <span class="error">
            <CheckoutFieldError field-name="phone" :validator="$v">
            </CheckoutFieldError>
          </span>
        </div>
        <!-- TODO: Add phone validation message(s) -->
        <!--        <template v-if="$v.phone.$error">-->
        <!--          <span-->
        <!--            class="error"-->
        <!--            v-for="error of $v.phone.$errors"-->
        <!--            :key="error.$uid"-->
        <!--            >{{ error.$message }}-->
        <!--          </span>-->
        <!--        </template>-->
        <div class="sameLevel inputs">
          <label for="email">Email Address</label>
          <input
            type="text"
            id="email"
            name="email"
            v-model.lazy="$v.email.$model"
          />
          <span class="error">
            <CheckoutFieldError field-name="email" :validator="$v">
            </CheckoutFieldError>
          </span>
        </div>
        <!-- TODO: Add email validation message(s) -->
        <!--        <template v-if="$v.email.$error">-->
        <!--          <span-->
        <!--            class="error"-->
        <!--            v-for="error of $v.email.$errors"-->
        <!--            :key="error.$uid"-->
        <!--            >{{ error.$message }}-->
        <!--          </span>-->
        <!--        </template>-->
        <div class="sameLevel inputs">
          <label for="ccNumber">Credit Card Number</label>
          <input
            type="text"
            id="ccNumber"
            name="ccNumber"
            v-model.lazy="$v.ccNumber.$model"
          />
          <span class="error">
            <CheckoutFieldError field-name="ccNumber" :validator="$v">
            </CheckoutFieldError>
          </span>
        </div>
        <!-- TODO: Add credit card validation message(s) -->
        <!--        <template v-if="$v.ccNumber.$error">-->
        <!--          <span-->
        <!--            class="error"-->
        <!--            v-for="error of $v.ccNumber.$errors"-->
        <!--            :key="error.$uid"-->
        <!--            >{{ error.$message }}-->
        <!--          </span>-->
        <!--        </template>-->
        <div class="sameLevel inputs">
          <label>Exp. Date</label>
          <div class="ccMonthYear">
            <div class="ccMonth">
              <select v-model="$v.ccExpiryMonth.$model">
                <option
                  v-for="(month, index) in months"
                  :key="index"
                  :value="index + 1"
                >
                  {{ month }} ({{ index + 1 }})
                </option>
              </select>
            </div>
            <span class="ccMonthYeargap"></span>
            <div class="ccYear">
              <!--            <label>Exp Year</label>-->
              <select v-model="$v.ccExpiryYear.$model">
                <!-- TODO: Complete this select tag for 'ccExpiryYear'. -->
                <option
                  v-for="(year, index) in years"
                  :key="index"
                  :value="year"
                >
                  {{ year }}
                </option>
              </select>
            </div>
          </div>
        </div>
        <!-- TODO (style): Use a single label for both month and date and put them on the same line. -->
        <!-- TODO (style): For example: Exp Date {Month} {Year}, with space between month/year selectors. -->

        <section v-show="form.checkoutStatus !== ''" class="checkoutStatusBox">
          <div v-if="form.checkoutStatus === 'ERROR'" class="error">
            Error: Please fix the problems above and try again.
          </div>

          <div v-else-if="form.checkoutStatus === 'PENDING'" class="pending">
            Processing...
          </div>

          <div v-else-if="form.checkoutStatus === 'OK'" class="success">
            Order placed!!!
          </div>

          <div v-else>An unexpected error occurred, please try again.</div>
        </section>

        <input
          type="submit"
          name="submit"
          class="button checkout-btn"
          :disabled="form.checkoutStatus === 'PENDING'"
          value="Complete Purchase"
        />
        <!-- TODO (style): The submit button should not take up the entire width of the form. -->
        <!-- TODO (style): The submit button should be styled consistent with your own site. -->
      </form>

      <!-- TODO (style): Fix error message placement so they nearer to the correct fields. -->
      <!-- TODO (style): HINT: Use another <div> and label, input, and error, and use flexbox to style. -->

      <!-- TODO: Display the cart total, subtotal and surcharge. -->
      <div class="order-summary-card">
        <p>
          Item(s): <span class="right">{{ cartStore.count }}</span>
        </p>
        <p>
          Subtotal:
          <span class="right">{{
            asDollarsAndCents(cartStore.subtotalPrice)
          }}</span>
        </p>
        <p>
          Tax & Shipping:
          <span class="right">{{ asDollarsAndCents(500) }}</span>
        </p>
        <hr />
        <p class="special">
          Total:
          <span class="right">
            {{ asDollarsAndCents(cartStore.totalPrice) }}
          </span>
        </p>
      </div>
    </section>
    <!-- TODO: Add an HTML section to display when checking out with an empty cart -->
    <section v-else>
      <h1 class="empty-checkout-page">There's nothing to checkout!</h1>
      <div class="center">
        <router-link :to="'/category/' + cartStore.selectedCategoryName">
          <button class="continue-btn">
            <i class="fa-solid fa-arrow-left-long"></i> Continue Shopping
          </button>
        </router-link>
      </div>
    </section>
  </div>
</template>
