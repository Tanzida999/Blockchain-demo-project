function Welcome() {
  return (
    <div className="welcome">
      <h1>👋 Welcome to the InsureChain</h1>
      <p>
        We are here to help you in the time of your Critical situation. This is a Blockchain based decentralized System.
      </p>
      <div className="header">
                <div className="text">Sign-Up</div>
                <div className="underline"></div>
            </div>
            <div className="inputs">
                <div className="input">
                <label htmlFor="">Name</label>    <input type="text" placeholder="Enter Your Name" />
                </div>
            </div>
            <div className="inputs">
                <div className="input">
                <label htmlFor="">Email</label>  <input type="email" placeholder="Enter Your Email" />
                </div>
            </div>
            <div className="inputs">
                <div className="input">
                <label htmlFor="">Password</label>  <input type="password" placeholder="Enter Your Password" />
                </div>
            </div>
            <div className="inputs">
                <div className="input">
                <label htmlFor="">NID</label>   <input type="text" placeholder="Enter Your NID"/>
                </div>
            </div>
            <div className="inputs">
                <div className="input">
                   <label htmlFor="">Age</label> <input type="number" placeholder="Enter Your Age"/>
                </div>
            </div>
            
     
    </div>
  );
}

export default Welcome;
