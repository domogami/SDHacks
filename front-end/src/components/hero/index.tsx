import Phones from "../../images/phones.svg";
import "./index.css";

function Hero() {
  return ( <div className="Hero">
  <div className='Hero-Text'>
    <h1>An Easy Way to Connect <span>Businesses</span> and <span>Investors</span></h1>
    <div className="Button">
      <a href="/">Learn More <i className="fa fa-arrow-right" aria-hidden="true"></i></a>
    </div>
  </div>
  
  <img alt="Phones" src={Phones}></img>
</div> );
}

export default Hero;