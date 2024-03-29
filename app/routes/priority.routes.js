module.exports = app => {
  const priority = require("../controllers/priority.controller.js");
  const Util = require("../common/common.util.js");

  // Add a new priority
  app.post("/priority/create", priority.create);

  // Get user's priority
  app.post("/priority/get/userid", priority.getPriorityByUserId);

  // Get user's ended priority by date
  app.post("/priority/get/end_date", priority.getPriorityByEndDate);

  // Get user's priority by week
  app.post("/priority/get/userid/week", priority.getPriorityByWeek);

  // Get user's priority by before week
  app.post("/priority/get/userid/week/before", priority.getPriorityByBeforeWeek);

  // Get user's not completed priority by before week
  app.post("/priority/get/userid/week/before/not_completed", priority.getNCPriorityByBeforeWeek);

  // Update a priority with id
  app.post("/priority/update", priority.updateByPriority);

  //======================================================= Agenda =============================================================
  // Add a new priority Agenda
  app.post("/priority/agenda/create", priority.createAgenda);

  // Get user's priority Agenda by pa_id
  app.post("/priority/agenda/get_by_wpid", priority.getAgendaByWpId);

  // Get user's priority by week
  // app.post("/priority/agenda/get/week", priority.getAgendaByWeek);

  // Update a priority with id
  app.post("/priority/agenda/update", priority.updateByPriorityAgenda);

  //==================================================== File ===============================================================
  // Upload file
  app.post("/priority/upload/file", Util.uploadFile);

  // Upload multiple files
  app.post("/priority/upload/multi_files", Util.uploadMultiFiles);

  // Add a new priority image
  app.post("/priority/file/create", priority.createPriorityFile);

  // Get user's priority files
  // app.post("/priority/get/files", priority.getPriorityFiles);
};