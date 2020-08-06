const express = require('express');
const session = require('express-session');
const exphbs  = require('express-handlebars');
const passport = require('passport');
const LocalStrategy = require('passport-local').Strategy
const hbs_sections = require('express-handlebars-sections');
const bcrypt = require('bcryptjs');
const moment = require('moment');

const app = express();

app.use(express.urlencoded({
    extended: true
}));

app.engine('hbs', exphbs({
    layoutsDir: 'views/_layouts',
    defaultLayout: 'main.hbs',
    extname: '.hbs',
    helpers: {
        section: hbs_sections()
    }
}));
app.set('view engine', 'hbs');
app.set('trust proxy', 1) // trust first proxy
  app.use(session({
    secret: 'keyboard cat',
    resave: false,
    saveUninitialized: true,
    cookie: {
      // secure: true
    }
}))
app.use(passport.initialize())
app.use(passport.session())

app.use('/public', express.static('public'));

app.use(function (req, res, next) {
    if (req.isAuthenticated()) {
        res.locals.lcIsAuthenticated = true;
        res.locals.lcAuthUser = req.user;
        if (req.user.Permission === 3) {
            res.locals.lcAdmin = true;
        }
    }

    next();
  })


const categoryModel = require('./models/category.model');
const subcategoryModel = require('./models/subcategory.model');
const postModel = require('./models/posts.model');
const _postModel = require('./models/_post.model');
const commentModel = require('./models/comment.model');

app.use(async function(req, res, next) {
    const rows = await categoryModel.allforuser();
    for (var i = 0; i < rows.length; i++) {
        if (i % 5 == 0) {
            rows[i].xd = 'margin-bottom: 45px;';
        }
    }
    for (var i = 0; i < rows.length; i++) {
        const row = await subcategoryModel.singleforuser(rows[i].CID);
        rows[i].subcategories = row;
    }
    res.locals.lcCategories = rows;
    next();
})

app.get('/', async function (req, res) {
    const rows = await _postModel.best();
    const cat_post = await categoryModel.singleByCID(rows[0].CID);
    const subcat_post = await subcategoryModel.single2(rows[0].SCID);
    rows[0].CName = cat_post.CName;
    if (rows[0].SCID !== null) {
        rows[0].SCName = subcat_post[0].SCName;
    }
    rows[0].Time = moment(rows[0].TimePost, 'YYYY-MM-DD hh:mm:ss').fromNow();
    const hot = await _postModel.hot2();
    const countComment = await commentModel.countByPostID(rows[0].PostID);
    rows[0].countComment = countComment[0].Count;
    for (var i = 0; i < hot.length; i++) {
        const cat = await categoryModel.singleByCID(hot[i].CID);
        const subc = await subcategoryModel.single2(hot[i].SCID);
        hot[i].CName = cat.CName;
        if (hot[i].SCID !== null) {
            hot[i].SCName = subc[0].SCName;
        }
        hot[i].Time = moment(hot[i].TimePost, 'YYYY-MM-DD hh:mm:ss').fromNow();
    }
    for (var i = 0; i < hot.length; i++) {
        if (hot[i].PostID === rows[0].PostID) {
            delete hot[i];
        }
    }
    
    const new10 = await _postModel.new10();
    const hot10 = await _postModel.hot10();


    res.render('home', {
        rows,
        hot,
        new10,
        hot10
    });
});

app.get('/admin', function (req, res) {
    if (req.isAuthenticated()) {
        res.render('adminpanel');
    } else {
        res.redirect('/dangnhap');
    }
    });

const categoryRouter = require('./routes/category.route');
app.use('/admin/categories', categoryRouter);

const subcategoryRouter = require('./routes/subcategory.route');
app.use('/admin/subcategories', subcategoryRouter);

const postRouter = require('./routes/posts.route');
app.use('/admin/posts', postRouter);

const userRouter = require('./routes/user.route');
app.use('/', userRouter);

const utilsRouter = require('./routes/utils.route');
app.use('/', utilsRouter);

const _postRouter = require('./routes/_post.route');
app.use('/post', _postRouter);

const userModel = require('./models/user.model');

app.route('/dangnhap')
.get(function(req, res) {
    res.render('_vwAccount/dangnhap')
})
.post(passport.authenticate('local', {failureRedirect: '/dangnhap',
                                      successRedirect: '/'}))

passport.use(new LocalStrategy(async function (username, password, done) {
    const user = await userModel.singleByUserName(username);
    const rs = bcrypt.compareSync(password, user.Password_hash);

    if(user === null && rs === false) {
        return done(null, false);
    } else {
        return done(null, user);
    }

    delete user.Password_hash;
}))

passport.serializeUser((user, done) => {
    done(null, user.UserName)
})

passport.deserializeUser(async function (name, done) {
    const user = await userModel.singleByUserName(name);
    delete user.Password_hash;

    if (user) {
        return done(null, user);
    } else {
        return done(null, false)
    }
})

app.get('/dangxuat', function (req, res) {
    req.logout();
    res.redirect(req.headers.referer);
})

const port = 3000;
app.listen(port, () => console.log(`Server is running http://localhost:${port}`));