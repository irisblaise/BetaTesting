import 'bootstrap';
//= require Chart.min

import { activateSearchBar } from './searchBar'
import { newQuestion, deleteQuestion } from "./version"

import { myFunction} from './toggle'
import { chart } from './chart'



activateSearchBar()
newQuestion()
deleteQuestion()
myFunction()
chart()
