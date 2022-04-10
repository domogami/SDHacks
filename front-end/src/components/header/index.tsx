import "./index.css";
import logo from "../../images/logo.png";

function Header() {
  return ( 
    <div className="Header">
      <img className="Logo" alt="logo" src={logo}></img>
      <p className="Fundr">Fundr</p>
      <p><a className="Head-Items" href="https://github.com/domogami/SDHacks">Our Mission</a></p>
      <p><a className="Head-Items" href="https://github.com/domogami/SDHacks">Showcase</a></p>
      <p><a className="Head-Items" href="https://github.com/domogami/SDHacks">Our Team</a></p>
      <a href="https://github.com/domogami/SDHacks" className="Action-Button">Download</a>
    </div>

  );
}

export default Header;