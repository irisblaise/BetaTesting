import 'bootstrap';
//= require Chart.min

import { activateSearchBar } from './searchBar'
import { newQuestion, deleteQuestion } from "./version"

import { openCity} from './toggle'
import { chart } from './chart'



activateSearchBar()
newQuestion()
deleteQuestion()
openCity()
chart()
