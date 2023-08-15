import { createRouter, createWebHistory } from 'vue-router'
import TestingView from '../views/TestingView.vue'
import TodosView from '../views/TodosView.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      // doesn't need to lazy load as this is the default route and will load anyway
      component: TodosView
    },
    {
      path: '/about',
      name: 'about',
      // route level code-splitting
      // this generates a separate chunk (About.[hash].js) for this route
      // which is lazy-loaded when the route is visited.
      component: () => import('../views/AboutView.vue')
    },
    {
      path: '/test',
      name: 'test',
      component: TestingView
    }
  ]
})

export default router
