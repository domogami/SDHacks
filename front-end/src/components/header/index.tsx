import "./index.css";
import logo from "../../images/logo.png";

function Header() {
  return ( 
    <div className="Header">
      <img className="Logo" alt="logo" src={logo}></img>
      <p className="Fundr">Fundr</p>
      <p><a className="Head-Items" href="/">Our Mission</a></p>
      <p><a className="Head-Items" href="/">Showcase</a></p>
      <p><a className="Head-Items" href="/">Our Team</a></p>
      <a href="/" className="Action-Button">Download</a>
    </div>

  );
}

export default Header;