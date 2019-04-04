<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html ng-app="Dashboard">
<head>
<%@ include file="/common/global.jsp" %>
<title>控制台</title>
<%@ include file="/common/meta.jsp" %>

  <link rel="stylesheet" type="text/css" href="${ctx}/common/bootstrap/css/bootstrap.css">
  <link rel="stylesheet" type="text/css" href="${ctx}/css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="${ctx}/less/dashboard/variables.less">
  <link rel="stylesheet" type="text/css" href="${ctx}/less/dashboard/mixins.less">
  <link rel="stylesheet" type="text/css" href="${ctx}/less/dashboard/main.less">
  <link rel="stylesheet" type="text/css" href="${ctx}/less/dashboard/loading.less">
  <link rel="stylesheet" type="text/css" href="${ctx}/less/dashboard/content.less">
  <link rel="stylesheet" type="text/css" href="${ctx}/less/dashboard/header.less">
  <link rel="stylesheet" type="text/css" href="${ctx}/less/dashboard/sidebar.less">
  <link rel="stylesheet" type="text/css" href="${ctx}/less/dashboard/widgets.less">
  <link rel="stylesheet" type="text/css" href="${ctx}/less/dashboard/hamburg.less">

  <!-- SCRIPTS -->
  <!-- build:js lib/angular/angular.js -->
  <script type="text/javascript" src="bower_components/angular/angular.js"></script>
  <!-- endbuild -->
  <!-- build:js lib/angular-cookies/angular-cookies.js -->
  <script type="text/javascript" src="bower_components/angular-cookies/angular-cookies.js"></script>
  <!-- endbuild -->
  <!-- build:js lib/angular-bootstrap/ui-bootstrap.js -->
  <script type="text/javascript" src="bower_components/angular-bootstrap/ui-bootstrap.js"></script>
  <!-- endbuild -->
  <!-- build:js lib/angular-bootstrap/ui-bootstrap-tpls.js -->
  <script type="text/javascript" src="bower_components/angular-bootstrap/ui-bootstrap-tpls.js"></script>
  <!-- endbuild -->
  <!-- build:js lib/angular-ui-router/angular-ui-router.js -->
  <script type="text/javascript" src="bower_components/angular-ui-router/release/angular-ui-router.js"></script>
  <!-- endbuild -->

  <!-- build:js js/dashboard.js -->
  <script type="text/javascript" src="js/dashboard/module.js"></script>
  <script type="text/javascript" src="js/dashboard/routes.js"></script>
  <script type="text/javascript" src="js/dashboard/controllers/master-ctrl.js"></script>
  <script type="text/javascript" src="js/dashboard/controllers/alerts-ctrl.js"></script>
  <script type="text/javascript" src="js/dashboard/directives/loading.js"></script>
  <!-- endbuild -->
  <!-- SCRIPTS -->

</head>
<body ng-controller="MasterCtrl">
  <div id="page-wrapper" ng-class="{'active': toggle}" ng-cloak>

    <!-- Sidebar -->

    <div id="sidebar-wrapper">
      <ul class="sidebar">
        <li class="sidebar-main">
          <a href="#" ng-click="toggleSidebar()">
            Dashboard
            <span class="menu-icon glyphicon glyphicon-transfer"></span>
          </a>
        </li>
        <li class="sidebar-title"><span>NAVIGATION</span></li>
        <li class="sidebar-list">
          <a href="#">Dashboard <span class="menu-icon fa fa-tachometer"></span></a>
        </li>
        <li class="sidebar-list">
          <a href="#/tables">Tables <span class="menu-icon fa fa-table"></span></a>
        </li>
        <li class="sidebar-list">
          <a href="#">Servers <span class="menu-icon fa fa-tasks"></span></a>
        </li>
        <li class="sidebar-list">
          <a href="#">Settings <span class="menu-icon fa fa-cogs"></span></a>
        </li>
        <li class="sidebar-title separator"><span>QUICK LINKS</span></li>
        <li class="sidebar-list">
          <a href="#" target="_blank">Forums <span class="menu-icon fa fa-external-link"></span></a>
        </li>
      </ul>
      <div class="sidebar-footer">
        <div class="col-xs-4">
        </div>
        <div class="col-xs-4">
          <a href="#" target="_blank">
            About
          </a>
        </div>
        <div class="col-xs-4">
          <a href="#">
            Support
          </a>
        </div>
      </div>
    </div>

    <!-- End Sidebar -->

    <div id="content-wrapper">
      <div class="page-content">

        <!-- Header Bar -->

        <div class="row header">
          <div class="col-xs-12">
            <div class="user pull-right">
              <div class="item dropdown">
                <a href="#" class="dropdown-toggle">
                  <img src="img/avatar.jpg">
                </a>
                <ul class="dropdown-menu dropdown-menu-right">
                  <li class="dropdown-header">
                    Joe Bloggs
                  </li>
                  <li class="divider"></li>
                  <li class="link">
                    <a href="#">
                      Profile
                    </a>
                  </li>
                  <li class="link">
                    <a href="#">
                      Menu Item
                    </a>
                  </li>
                  <li class="link">
                    <a href="#">
                      Menu Item
                    </a>
                  </li>
                  <li class="divider"></li>
                  <li class="link">
                    <a href="#">
                      Logout
                    </a>
                  </li>
                </ul>
              </div>
              <div class="item dropdown">
               <a href="#" class="dropdown-toggle">
                  <i class="fa fa-bell-o"></i>
                </a>
                <ul class="dropdown-menu dropdown-menu-right">
                  <li class="dropdown-header">
                    Notifications
                  </li>
                  <li class="divider"></li>
                  <li>
                    <a href="#">Server Down!</a>
                  </li>
                </ul>
              </div>
            </div>
            <div class="meta">
              <div class="page">
                Dashboard
              </div>
              <div class="breadcrumb-links">
                Home / Dashboard
              </div>
            </div>
          </div>
        </div>

        <!-- End Header Bar -->

        <!-- Main Content -->
        <section data-ui-view></section>
      </div><!-- End Page Content -->
    </div><!-- End Content Wrapper -->
  </div><!-- End Page Wrapper -->

  <script type="text/ng-template" id="dashboard.html">
    <div class="row alerts-container" data-ng-controller="AlertsCtrl" data-ng-show="alerts.length">
      <div class="col-xs-12">
        <alert data-ng-repeat="alert in alerts" type="{{alert.type}}" close="closeAlert($index)">{{alert.msg}}</alert>
      </div>
    </div>

    <div class="row">
      <div class="col-lg-3 col-md-6 col-xs-12">
        <div class="widget">
          <div class="widget-body">
            <div class="widget-icon green pull-left">
              <i class="fa fa-users"></i>
            </div>
            <div class="widget-content pull-left">
              <div class="title">80</div>
              <div class="comment">Users</div>
            </div>
            <div class="clearfix"></div>
          </div>
        </div>
      </div>
      <div class="col-lg-3 col-md-6 col-xs-12">
        <div class="widget">
          <div class="widget-body">
            <div class="widget-icon red pull-left">
              <i class="fa fa-tasks"></i>
            </div>
            <div class="widget-content pull-left">
              <div class="title">16</div>
              <div class="comment">Servers</div>
            </div>
            <div class="clearfix"></div>
          </div>
        </div>
      </div>
      <div class="col-lg-3 col-md-6 col-xs-12">
        <div class="widget">
          <div class="widget-body">
            <div class="widget-icon orange pull-left">
              <i class="fa fa-sitemap"></i>
            </div>
            <div class="widget-content pull-left">
              <div class="title">225</div>
              <div class="comment">Documents</div>
            </div>
            <div class="clearfix"></div>
          </div>
        </div>
      </div>
      <div class="spacer visible-xs"></div>
      <div class="col-lg-3 col-md-6 col-xs-12">
        <div class="widget">
          <div class="widget-body">
            <div class="widget-icon blue pull-left">
              <i class="fa fa-support"></i>
            </div>
            <div class="widget-content pull-left">
              <div class="title">62</div>
              <div class="comment">Tickets</div>
            </div>
            <div class="clearfix"></div>
          </div>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col-lg-6">
        <div class="widget">
          <div class="widget-header">
            <i class="fa fa-tasks"></i> Servers
            <a href="#" class="pull-right">Manage</a>
          </div>
          <div class="widget-body medium no-padding">
            <div class="table-responsive">
              <table class="table">
                <tbody>
                  <tr><td>RDVMPC001</td><td>238.103.133.37</td><td><span class="text-success"><i class="fa fa-check"></i></span></td></tr>
                  <tr><td>RDVMPC002</td><td>68.66.63.170</td><td><span class="text-success"><i class="fa fa-check"></i></span></td></tr>
                  <tr><td>RDVMPC003</td><td>76.117.212.33</td><td><span tooltip="Server Down!" class="text-danger"><i class="fa fa-warning"></i></span></td></tr>
                  <tr><td>RDPHPC001</td><td>91.88.224.5</td><td><span class="text-success"><i class="fa fa-check"></i></span></td></tr>
                  <tr><td>RDESX001</td><td>197.188.15.93</td><td><span class="text-success"><i class="fa fa-check"></i></span></td></tr>
                  <tr><td>RDESX002</td><td>168.85.154.251</td><td><span class="text-success"><i class="fa fa-check"></i></span></td></tr>
                  <tr><td>RDESX003</td><td>209.25.191.61</td><td><span tooltip="Server Down!" class="text-danger"><i class="fa fa-warning"></i></span></td></tr>
                  <tr><td>RDESX004</td><td>252.37.192.235</td><td><span class="text-success"><i class="fa fa-check"></i></span></td></tr>
                  <tr><td>RDTerminal01</td><td>139.71.18.207</td><td><span class="text-success"><i class="fa fa-check"></i></span></td></tr>
                  <tr><td>RDTerminal02</td><td>136.80.122.212</td><td><span tooltip="Could not connect!" class="text-warning"><i class="fa fa-flash"></i></span></td></tr>
                  <tr><td>RDDomainCont01</td><td>196.80.245.33</td><td><span class="text-success"><i class="fa fa-check"></i></span></td></tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
      <div class="col-lg-6">
        <div class="widget">
          <div class="widget-header">
            <i class="fa fa-users"></i> Users
            <input type="text" placeholder="Search" class="form-control input-sm pull-right" />
            <div class="clearfix"></div>
          </div>
          <div class="widget-body medium no-padding">
            <div class="table-responsive">
              <table class="table">
                <thead>
                  <tr><th class="text-center">ID</th><th>Username</th><th>Role</th><th>Account</th></tr>
                </thead>
                <tbody>
                  <tr><td class="text-center">1</td><td>Joe Bloggs</td><td>Super Admin</td><td>AZ23045</td></tr>
                  <tr><td class="text-center">2</td><td>Timothy Hernandez</td><td>Admin</td><td>AU24783</td></tr>
                  <tr><td class="text-center">3</td><td>Joe Bickham</td><td>User</td><td>AM23781</td></tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col-lg-6">
        <div class="widget">
          <div class="widget-header">
            <i class="fa fa-plus"></i> Extras
            <button class="btn btn-sm btn-info pull-right">Button</button>
            <div class="clearfix"></div>
          </div>
          <div class="widget-body">

            <div class="message">
              This is a standard message which will also work the ".no-padding" class, I can also <span class="error">be an error message!</span>
            </div>

            <hr />

            <div class="message">
              <a href="http://angular-ui.github.io/bootstrap/" target="_blank">UI Bootstrap</a> is included, so you can use <a href="#" tooltip="I'm a tooltip!">tooltips</a> and all of the other native Bootstrap JS components!
            </div>

            <hr />

            <form class="form-horizontal" role="form">
              <div class="form-group has-feedback has-success">
                <label for="label" class="col-sm-2 control-label">Inline Form</label>
                <div class="col-sm-5">
                  <input  type="text" class="form-control" />
                    <span class="fa fa-key form-control-feedback"></span>
                </div>
                <div class="col-sm-5">
                  <div class="input-mask">I'm an input mask!</div>
                </div>
              </div>
            </form>

          </div>
        </div>
      </div>
      <div class="col-lg-6">
        <div class="widget">
          <div class="widget-header">
            <i class="fa fa-cog fa-spin"></i> Loading Directive
            <a href="http://tobiasahlin.com/spinkit/" target="_blank" class="pull-right">SpinKit</a>
          </div>
          <div class="widget-body">
            <!-- Check out the Angular Directive inside bootstrap.js! -->
            <rd-loading></rd-loading>
          </div>
        </div>
      </div>
    </div>
    <!-- End Main Content -->
  </script>

  <script type="text/ng-template" id="tables.html">
    <div class="row">
      <div class="col-lg-6">
        <div class="widget">
          <div class="widget-header">
            <i class="fa fa-tasks"></i> Servers
            <a href="#" class="pull-right">Manage</a>
          </div>
          <div class="widget-body medium no-padding">
            <div class="table-responsive">
              <table class="table">
                <tbody>
                  <tr><td>RDVMPC001</td><td>238.103.133.37</td><td><span class="text-success"><i class="fa fa-check"></i></span></td></tr>
                  <tr><td>RDVMPC002</td><td>68.66.63.170</td><td><span class="text-success"><i class="fa fa-check"></i></span></td></tr>
                  <tr><td>RDVMPC003</td><td>76.117.212.33</td><td><span tooltip="Server Down!" class="text-danger"><i class="fa fa-warning"></i></span></td></tr>
                  <tr><td>RDPHPC001</td><td>91.88.224.5</td><td><span class="text-success"><i class="fa fa-check"></i></span></td></tr>
                  <tr><td>RDESX001</td><td>197.188.15.93</td><td><span class="text-success"><i class="fa fa-check"></i></span></td></tr>
                  <tr><td>RDESX002</td><td>168.85.154.251</td><td><span class="text-success"><i class="fa fa-check"></i></span></td></tr>
                  <tr><td>RDESX003</td><td>209.25.191.61</td><td><span tooltip="Server Down!" class="text-danger"><i class="fa fa-warning"></i></span></td></tr>
                  <tr><td>RDESX004</td><td>252.37.192.235</td><td><span class="text-success"><i class="fa fa-check"></i></span></td></tr>
                  <tr><td>RDTerminal01</td><td>139.71.18.207</td><td><span class="text-success"><i class="fa fa-check"></i></span></td></tr>
                  <tr><td>RDTerminal02</td><td>136.80.122.212</td><td><span tooltip="Could not connect!" class="text-warning"><i class="fa fa-flash"></i></span></td></tr>
                  <tr><td>RDDomainCont01</td><td>196.80.245.33</td><td><span class="text-success"><i class="fa fa-check"></i></span></td></tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
      <div class="col-lg-6">
        <div class="widget">
          <div class="widget-header">
            <i class="fa fa-tasks"></i> Striped Servers
            <a href="#" class="pull-right">Manage</a>
          </div>
          <div class="widget-body medium no-padding">
            <div class="table-responsive table-striped">
              <table class="table">
                <tbody>
                  <tr><td>RDVMPC001</td><td>238.103.133.37</td><td><span class="text-success"><i class="fa fa-check"></i></span></td></tr>
                  <tr><td>RDVMPC002</td><td>68.66.63.170</td><td><span class="text-success"><i class="fa fa-check"></i></span></td></tr>
                  <tr><td>RDVMPC003</td><td>76.117.212.33</td><td><span tooltip="Server Down!" class="text-danger"><i class="fa fa-warning"></i></span></td></tr>
                  <tr><td>RDPHPC001</td><td>91.88.224.5</td><td><span class="text-success"><i class="fa fa-check"></i></span></td></tr>
                  <tr><td>RDESX001</td><td>197.188.15.93</td><td><span class="text-success"><i class="fa fa-check"></i></span></td></tr>
                  <tr><td>RDESX002</td><td>168.85.154.251</td><td><span class="text-success"><i class="fa fa-check"></i></span></td></tr>
                  <tr><td>RDESX003</td><td>209.25.191.61</td><td><span tooltip="Server Down!" class="text-danger"><i class="fa fa-warning"></i></span></td></tr>
                  <tr><td>RDESX004</td><td>252.37.192.235</td><td><span class="text-success"><i class="fa fa-check"></i></span></td></tr>
                  <tr><td>RDTerminal01</td><td>139.71.18.207</td><td><span class="text-success"><i class="fa fa-check"></i></span></td></tr>
                  <tr><td>RDTerminal02</td><td>136.80.122.212</td><td><span tooltip="Could not connect!" class="text-warning"><i class="fa fa-flash"></i></span></td></tr>
                  <tr><td>RDDomainCont01</td><td>196.80.245.33</td><td><span class="text-success"><i class="fa fa-check"></i></span></td></tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
  </script>
</body>
</html>
