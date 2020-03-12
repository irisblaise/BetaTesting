import 'bootstrap';
//= require Chart.min

import { activateSearchBar } from './searchBar'
import { newQuestion, deleteQuestion } from "./version"
import { calculatePricePreview } from "./calculatePricePreview"

import { lineCharts} from './chart2'
import { charts } from './chart'



activateSearchBar()
newQuestion()
deleteQuestion()
calculatePricePreview()
// charts()
lineCharts()
