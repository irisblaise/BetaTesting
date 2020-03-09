import 'bootstrap';
//= require Chart.min

import { activateSearchBar } from './searchBar'
import { newQuestion, deleteQuestion } from "./version"
import { chart } from './chart'


activateSearchBar()
newQuestion()
deleteQuestion()
chart()
