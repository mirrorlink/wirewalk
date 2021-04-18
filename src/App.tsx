import "./App.css";

import anim from "./images/construction.gif";
import bgMobile from "./images/bgmobile.png";

import { BrowserView, MobileView } from "react-device-detect";
import { Box, List, ListItem } from "@material-ui/core";

function App(): any {
  return (
    <div>
      <BrowserView>
      <div className="App">
        <header className="App-header">
          <p className="MainText">
            An Action-RPG Game Where you Raid virus-infected digital systems for the lols.
          </p>


          <div className="bottomRight">
            <p className="subText">
              Under construction..
            </p>

            <Box
              paddingLeft="50px">
                  <img src={anim} className="construction" />
            </Box>

          </div>

        </header>
      </div>
      </BrowserView>
      <MobileView>
        <div className="AppMobile">


          <List disablePadding>
            <ListItem disableGutters>
            <img  src={bgMobile} className="imgMobile" />
            </ListItem>
            <ListItem>
            <Box
              width={1}
              display="flex"
              alignItems="center"
              justifyContent="center">
                <p className="MainTextMobile">
                  An Action-RPG Game Where you Raid virus-infected digital systems for the lols.
                </p>
            </Box>
            </ListItem>
            <ListItem>
            <Box
              width={1}
              paddingLeft="50px"
              display="flex"
              alignItems="center"
              justifyContent="center">
                  <img src={anim} className="construction" />
            </Box>
            </ListItem>
            <ListItem>
            <Box
              paddingTop="20px"
              width={1}
              display="flex"
              alignItems="center"
              justifyContent="center">
                <p className="MainTextMobile">
                  Website under construction..
                </p>
            </Box>
            </ListItem>
          </List>

        </div>
        </MobileView>
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
