import "bootstrap";

import AOS from "aos";
import initSlick from "plugins/init_slick";
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import { initMapbox } from '../plugins/init_mapbox';

initSlick();
AOS.init();
console.log('test');
initMapbox();
