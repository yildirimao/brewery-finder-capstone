import Vue from 'vue'
import Router from 'vue-router'
import Home from '../views/Home.vue'
import Login from '../views/Login.vue'
import Logout from '../views/Logout.vue'
import Register from '../views/Register.vue'
import AgeFilter from '../views/AgeFilter.vue'
import BreweryDisplay from '../views/BreweryDisplay.vue'
import BeerDisplay from '../views/BeerDisplay.vue'
import store from '../store/index'
import Admin from '../views/Admin.vue'



Vue.use(Router)

/**
 * The Vue Router is used to "direct" the browser to render a specific view component
 * inside of App.vue depending on the URL.
 *
 * It also is used to detect whether or not a route requires the user to have first authenticated.
 * If the user has not yet authenticated (and needs to) they are redirected to /login
 * If they have (or don't need to) they're allowed to go about their way.
 */

const router = new Router({
  mode: 'history',
  base: process.env.BASE_URL,
  routes: [
    {
      path: '/',
      name: 'home',
      component: Home,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/login",
      name: "login",
      component: Login,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/logout",
      name: "logout",
      component: Logout,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/register",
      name: "register",
      component: Register,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/agefilter",
      name: "agefilter",
      component: AgeFilter,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/brewery/:id",
      name: "brewery",
      component: BreweryDisplay,
      meta: {
        requiresAuth: false
      }
    },

    {
      path: "/beer/:id",
      name: "beer",
      component: BeerDisplay,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/admin",
      name: "admin",
      component: Admin,
      meta: {
        requiresAuth: true
      }
    },
  ]
})

router.beforeEach((to, from, next) => {
  // Determine if the route requires Authentication
  const requiresAuth = to.matched.some(x => x.meta.requiresAuth);
  const authorized = store.state.token === '';
  const is21 = localStorage.getItem("is21");

  if (authorized && !is21 && to.name != "agefilter") {
    //21+ filter
    next("/agefilter");
  } else if (requiresAuth && authorized) {
    // If it does and they are not logged in, send the user to "/login"
    next("/login");
  } else {
    // Else let them go to their next destination
    next();
  }
});

export default router;
