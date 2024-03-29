const Client = require("../models/client.model.js");
const User = require("../models/user.model.js");
const WorkSetting = require("../models/worksetting.model.js");
const AccountSetting = require("../models/accountsetting.model.js");

// Create and Save a new User
exports.createClient = (req, res) => {
  // Validate request
  if (!req.body) {
    res.status(400).send({
      message: "Content can not be empty!"
    });
  }

  // Create a Client
  const client = new Client({
    client_name: req.body.client_name,
    is_active: req.body.is_active || true
  });

  // Save Client in the database
  Client.insertNewClient(client, (err, data) => {
    if (err)
      res.status(500).send({
        message:
          err.message || "Some error occurred while creating the Client."
      });
    else {
      res.send(data);      
    }
  });
};

// Update a Client identified by the id in the request
exports.updateByClient = (req, res) => {
    // Validate Request
    if (!req.body) {
      res.status(400).send({
        message: "Content can not be empty!"
      });
    }
  
    console.log(req.body);
    const client = new Client(req.body);
    Client.updateByClient(
        client,
      (err, data) => {
        if (err) {
          if (err.kind === "not_found") {
            res.status(404).send({
              message: `Not found client with id ${client.client_id}.`
            });
          } else {
            res.status(500).send({
              message: "Error updating client with id " + client.client_id
            });
          }
        } else res.send(data);
      }
    );
  };

// Regist My client
exports.registMyClient = (req, res) => {
    // Validate request
    if (!req.body) {
      res.status(400).send({
        message: "Content can not be empty!"
      });
    }
  
    // Regist my Client
    const client = new Client({
      user_id: req.body.user_id,
      client_id: req.body.client_id,
      is_active: req.body.is_active || false
    });
  
    // Save Client in the database
    Client.registMyClient(client, (err, data) => {
      if (err)
        res.status(500).send({
          message:
            err.message || "Some error occurred while creating the Client."
        });
      else {
        res.send(data);      
      }
    });
  };

// Get My clients
exports.getMyClients = (req, res) => {
    // Validate request
    if (!req.body) {
      res.status(400).send({
        message: "Content can not be empty!"
      });
    }    
  
    // Save Client in the database
    Client.getMyClients(req.body.user_id, (err, data) => {
      if (err)
        res.status(500).send({
          message:
            err.message || "Some error occurred while creating the Client."
        });
      else {
        res.send(data);      
      }
    });
  };

  // Get My clients
exports.getCompanyClients = (req, res) => {
  // Validate request
  if (!req.body) {
    res.status(400).send({
      message: "Content can not be empty!"
    });
  }    

  // Save Client in the database
  Client.getCompanyClients(req.body.company_id, (err, data) => {
    if (err)
      res.status(500).send({
        message:
          err.message || "Some error occurred while creating the Client."
      });
    else {
      res.send(data);      
    }
  });
};


//============================================================ Work Setting ================================================================
// Create and Save a new WorkSetting
exports.createWorkSetting = (req, res) => {
  // Validate request
  if (!req.body) {
    res.status(400).send({
      message: "Content can not be empty!"
    });
  }

  // Create a WorkSetting
  const workSetting = new WorkSetting({
    user_id : req.body.user_id,
    first_day_of_week : req.body.first_day_of_week,
    week : req.body.week,
    year : req.body.year,
    work_on_week : req.body.work_on_week,
    start_work_time : req.body.start_work_time,
    end_work_time : req.body.end_work_time,
    remainder : req.body.remainder
  });

  // Save WorkSetting in the database
  WorkSetting.insertNewWorkSetting(workSetting, (err, data) => {
    if (err)
      res.status(500).send({
        message:
          err.message || "Some error occurred while creating the Company."
      });
    else {
      res.send(data);      
    }
  });
};

//Save WorkSetting Array
exports.createWorkSettingByArray = (req, res) => {
  // Validate request
  if (!req.body) {
    res.status(400).send({
      message: "Content can not be empty!"
    });
  }

  // Save WorkSetting in the database
  WorkSetting.createWorkSettingByArray(req.body.workSettingArray, (err, data) => {
    if (err)
      res.status(500).send({
        message:
          err.message || "Some error occurred while creating the Company."
      });
    else {
      res.send(data);      
    }
  });
};

// Get My Work Settings
exports.getWorkSettingByUserId = (req, res) => {
  // Validate request
  if (!req.body) {
    res.status(400).send({
      message: "Content can not be empty!"
    });
  }    

  // Save WorkSetting in the database
  WorkSetting.getWorkSettingByUserId(req.body.user_id, (err, data) => {
    if (err)
      res.status(500).send({
        message:
          err.message || "Some error occurred while getting the WorkSetting."
      });
    else {
      res.send(data);      
    }
  });
};

  // Update a WorkSetting
exports.updateByWorkSetting = (req, res) => {
  // Validate Request
  if (!req.body) {
    res.status(400).send({
      message: "Content can not be empty!"
    });
  }

  console.log(req.body);
  const ws = new WorkSetting(req.body);
  WorkSetting.updateByWorkSetting(
      ws,
    (err, data) => {
      if (err) {
        if (err.kind === "not_found") {
          res.status(404).send({
            message: `Not found WorkSetting with id ${ws.ws_id}.`
          });
        } else {
          res.status(500).send({
            message: "Error updating WorkSetting with id " + ws.ws_id
          });
        }
      } else res.send(data);
    }
  );
};

  //============================================================ Date, Time, Currency Setting ================================================================
  // Create and Save a new Date, Time, Currency Setting
  exports.createAccountSetting = (req, res) => {
    // Validate request
    if (!req.body) {
      res.status(400).send({
        message: "Content can not be empty!"
      });
    }
  
    // Create a Date, Time, Currency Setting
    const as = new AccountSetting(req.body);  
    // Save Date, Time, Currency Setting in the database
    AccountSetting.insertNewAS(as, (err, data) => {
      if (err)
        res.status(500).send({
          message:
            err.message || "Some error occurred while creating the Company."
        });
      else {
        res.send(data);      
      }
    });
  };

// Get My Date, Time, Currency Setting
exports.getAccountSettingByUserId = (req, res) => {
  // Validate request
  if (!req.body) {
    res.status(400).send({
      message: "Content can not be empty!"
    });
  }    

  // Save WorkSetting in the database
  AccountSetting.getAccountSettingByUserId(req.body.user_id, (err, data) => {
    if (err)
      res.status(500).send({
        message:
          err.message || "Some error occurred while getting the AccountSetting."
      });
    else {
      res.send(data);      
    }
  });
};

  // Update Date, Time, Currency Setting
exports.updateByAccountSetting = (req, res) => {
  // Validate Request
  if (!req.body) {
    res.status(400).send({
      message: "Content can not be empty!"
    });
  }

  console.log(req.body);
  const as = new AccountSetting(req.body);
  AccountSetting.updateByAccountSetting(
    as,
    (err, data) => {
      if (err) {
        if (err.kind === "not_found") {
          res.status(404).send({
            message: `Not found AccountSetting with id ${as.as_id}.`
          });
        } else {
          res.status(500).send({
            message: "Error updating AccountSetting with id " + as.as_id
          });
        }
      } else res.send(data);
    }
  );
};

  