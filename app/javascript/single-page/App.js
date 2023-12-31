import React, { useEffect } from 'react';
import clsx from 'clsx';
import { makeStyles, useTheme } from '@material-ui/core/styles';
import Drawer from '@material-ui/core/Drawer';
import CssBaseline from '@material-ui/core/CssBaseline';
import AppBar from '@material-ui/core/AppBar';
import Toolbar from '@material-ui/core/Toolbar';
import List from '@material-ui/core/List';
import Typography from '@material-ui/core/Typography';
import Divider from '@material-ui/core/Divider';
import IconButton from '@material-ui/core/IconButton';
import MenuIcon from '@material-ui/icons/Menu';
import ChevronLeftIcon from '@material-ui/icons/ChevronLeft';
import ChevronRightIcon from '@material-ui/icons/ChevronRight';
import ListItem from '@material-ui/core/ListItem';
import ListItemIcon from '@material-ui/core/ListItemIcon';
import ListItemText from '@material-ui/core/ListItemText';
import TimerIcon from '@material-ui/icons/Timer';
import ExitToAppIcon from '@material-ui/icons/ExitToApp';
import WebIcon from '@material-ui/icons/Web';
import { BrowserRouter as Router, Route, NavLink } from 'react-router-dom'
import Landing from './pages/Landing.js'
import axios from 'axios'
import { ToastContainer, toast } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';

const drawerWidth = 240;

const useStyles = makeStyles((theme) => ({
  root: {
    display: 'flex',
  },
  appBar: {
    transition: theme.transitions.create(['margin', 'width'], {
      easing: theme.transitions.easing.sharp,
      duration: theme.transitions.duration.leavingScreen,
    }),
  },
  appBarShift: {
    width: `calc(100% - ${drawerWidth}px)`,
    marginLeft: drawerWidth,
    transition: theme.transitions.create(['margin', 'width'], {
      easing: theme.transitions.easing.easeOut,
      duration: theme.transitions.duration.enteringScreen,
    }),
  },
  menuButton: {
    marginRight: theme.spacing(2),
  },
  hide: {
    display: 'none',
  },
  drawer: {
    width: drawerWidth,
    flexShrink: 0,
  },
  drawerPaper: {
    width: drawerWidth,
  },
  drawerHeader: {
    display: 'flex',
    alignItems: 'center',
    padding: theme.spacing(0, 1),
    // necessary for content to be below app bar
    ...theme.mixins.toolbar,
    justifyContent: 'flex-end',
  },
  content: {
    flexGrow: 1,
    padding: theme.spacing(3),
    transition: theme.transitions.create('margin', {
      easing: theme.transitions.easing.sharp,
      duration: theme.transitions.duration.leavingScreen,
    }),
    marginLeft: -drawerWidth,
  },
  contentShift: {
    transition: theme.transitions.create('margin', {
      easing: theme.transitions.easing.easeOut,
      duration: theme.transitions.duration.enteringScreen,
    }),
    marginLeft: 0,
  },
}));

export default function App(props) {
  const classes = useStyles();
  const theme = useTheme();
  const [open, setOpen] = React.useState(false);
  // const current_user = props.current_user;

  function handleDrawerOpen()  {
    setOpen(true);
  };

  function handleDrawerClose() {
    setOpen(false);
  };

  function signOut(e) {
    e.preventDefault();
    axios.delete('/users/sign_out.json')
      .then(function(res){
        window.location.href = '/public?flash_notice=Você não está mais logado no sistema.'
      })
      .catch(function(error){
        console.log(error);
      });
  }

  useEffect(() => {
    // Atualiza o titulo do documento usando a API do browser
    if (props.flash.notice) {
      toast.info(props.flash.notice);
    }
    if (props.flash.notice) {
      toast.warning(props.flash.alert);
    }
  }, []);

  return (
    <Router>
      <div className={classes.root}>
        <CssBaseline />
        <AppBar
          position="fixed"
          className={clsx(classes.appBar, {
            [classes.appBarShift]: open,
          })}
        >
          <Toolbar>
            <IconButton
              color="inherit"
              aria-label="open drawer"
              onClick={handleDrawerOpen}
              edge="start"
              className={clsx(classes.menuButton, open && classes.hide)}
            >
              <MenuIcon />
            </IconButton>
            <Typography variant="h6" noWrap>
              Teste react
            </Typography>
          </Toolbar>
        </AppBar>
        <Drawer
          className={classes.drawer}
          variant="persistent"
          anchor="left"
          open={open}
          classes={{
            paper: classes.drawerPaper,
          }}
        >
          <div className={classes.drawerHeader}>
            <IconButton onClick={handleDrawerClose}>
              {theme.direction === 'ltr' ? <ChevronLeftIcon /> : <ChevronRightIcon />}
            </IconButton>
          </div>
          <Divider />
          <List>
            <NavLink to='/site/landing' onClick={() => setOpen(false)}>
              <ListItem button key='landing'>
                <ListItemIcon><WebIcon /></ListItemIcon>
                <ListItemText primary='Landing' />
              </ListItem>
            </NavLink>
            <Divider />
            <NavLink to='#' onClick={signOut}>
              <ListItem button key='counter'>
                <ListItemIcon><ExitToAppIcon /></ListItemIcon>
                <ListItemText primary='Sign out' />
              </ListItem>
            </NavLink>
          </List>
        </Drawer>
        <main
          className={clsx(classes.content, {
            [classes.contentShift]: open,
          })}
        >
          <div className={classes.drawerHeader} />
          <ToastContainer autoClose={8000} />
          <Route exact path={["/site", "/site/landing"]}>
            <Landing />
          </Route>
        </main>
      </div>
    </Router>
  );
}
