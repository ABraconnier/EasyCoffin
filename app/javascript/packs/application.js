import "bootstrap";

import AOS from "aos";
import initSlick from "plugins/init_slick";
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import { initMapbox } from '../plugins/init_mapbox';
import { initAutocomplete } from '../plugins/init_autocomplete';

initSlick();
AOS.init();
initMapbox();
initAutocomplete();
