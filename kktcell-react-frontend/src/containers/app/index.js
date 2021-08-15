import React from 'react'
import { Route } from 'react-router-dom'
import Home from '../home'
import StaffListComponent from '../components/hr/staff-list'

import AppHeader from './app-header'
import AppFooter from './app-footer'

const App = () => (
  <div className="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">

    {/* Bootstrap header */}
    <AppHeader />

    <main className="px-3">
      <section className="py-5 text-center container">
        <div className="row py-lg-5">
          <Route exact path="/" component={Home} />
          <Route exact path="/staff-list" component={StaffListComponent} /> {/* Defined route for test purposes */}
        </div>
      </section>
    </main>

    {/* Bootstrap footer */}
    <AppFooter />
  </div>

)

export default App
