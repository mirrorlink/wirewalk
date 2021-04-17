import "./App.css";

import anim from "./images/construction.gif";


function App(): any {
  return (
    <div className="App">
      <header className="App-header">
        <p className="MainText">
          An Action-RPG Where you Raid virus-infected digital systems for the lols.
        </p>


        <div className="bottomRight">
          <p className="subText">
            Under construction..
          </p>
          <img src={anim} className="construction" />

        </div>

      </header>
    </div>
  );
}

/*
//import MailchimpSubscribe from "react-mailchimp-subscribe";
const url: string = "//xxxx.us13.list-manage.com/subscribe/post?u=zefzefzef&id=fnfgn";
        <div className="MailChimp">
          <p className="subscribe">
            Subscribe for news!
          </p>
          <MailchimpSubscribe url={url}/>
        </div>
*/

export default App;
