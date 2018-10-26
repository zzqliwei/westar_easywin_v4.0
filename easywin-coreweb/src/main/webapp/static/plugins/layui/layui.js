/** layui-v0.1.5 跨设备模块化前端框架@LGPL www.layui.com By 贤心 */
; !
function(e) {
    var t = function() {
        this.v = "0.1.5"
    };
    t.fn = t.prototype;
    var n = document,
    o = {},
    r = t.fn.cache = {},
    i = function() {
        var e = n.scripts,
        t = e[e.length - 1].src;
        return t.substring(0, t.lastIndexOf("/") + 1)
    } (),
    l = function(t) {
        e.console && console.error && console.error("layui Error: " + t)
    },
    u = "undefined" != typeof opera && "[object Opera]" === opera.toString();
    r.modules = {},
    r.status = {},
    r.timeout = 10,
    t.fn.define = function(e, t) {
        var n = this,
        o = "function" == typeof e;
        return o && (t = e),
        n.use(o ? [] : e,
        function() {
            "function" == typeof t && t(function(e, t) {
                layui[e] = t,
                r.status[e] = !0
            })
        }),
        n
    },
    t.fn.use = function(e, t, a) {
        function s(e, t) {
            var n = "PLAYSTATION 3" === navigator.platform ? /^complete$/: /^(complete|loaded)$/; ("load" === e.type || n.test((e.currentTarget || e.srcElement).readyState)) && (r.modules[y] = t, m.removeChild(v),
            function o() {
                return++p > 1e3 * r.timeout / 4 ? l(y + " is not a valid module") : void(r.status[y] ? c() : setTimeout(o, 4))
            } ())
        }
        function c() {
            a.push(layui[y]),
            e.length > 1 ? d.use(e.slice(1), t, a) : "function" == typeof t && t.apply(layui, a)
        }
        var d = this,
        f = r.dir = r.dir ? r.dir: i,
        m = n.getElementsByTagName("head")[0];
        e = "string" == typeof e ? [e] : e;
        var y = e[0],
        p = 0;
        if (a = a || [], r.host = r.host || (f.match(/\/\/([\s\S]+?)\//) || ["//" + location.host + "/"])[0], 0 === e.length) return t();
        var v = n.createElement("script"),
        g = (o.modules[y] ? f + "lay/": r.base || "") + (d.modules[y] || y) + ".js";
        return v.async = !0,
        v.src = g +
        function() {
            var e = r.version === !0 ? r.v || (new Date).getTime() : r.version || "";
            return e ? "?v=" + e: ""
        } (),
        r.modules[y] ? !
        function h() {
            return++p > 1e3 * r.timeout / 4 ? l(y + " is not a valid module") : void("string" == typeof r.modules[y] && r.status[y] ? c() : setTimeout(h, 4))
        } () : (m.appendChild(v), !v.attachEvent || v.attachEvent.toString && v.attachEvent.toString().indexOf("[native code") < 0 || u ? v.addEventListener("load",
        function(e) {
            s(e, g)
        },
        !1) : v.attachEvent("onreadystatechange",
        function(e) {
            s(e, g)
        })),
        r.modules[y] = g,
        d
    },
    t.fn.all = function(e) {
        var t = this,
        n = Object.keys ? Object.keys(t.modules) : function() {
            var e = [];
            for (var n in t.modules) e.push(n);
            return e
        } ();
        return layui.use(n, e),
        t
    },
    t.fn.getStyle = function(t, n) {
        var o = t.currentStyle ? t.currentStyle: e.getComputedStyle(t, null);
        return o[o.getPropertyValue ? "getPropertyValue": "getAttribute"](n)
    },
    t.fn.link = function(e, t, o) {
        var i = this,
        u = n.createElement("link"),
        a = n.getElementsByTagName("head")[0];
        "string" == typeof t && (o = t);
        var s = (o || e).replace(/\.|\//g, ""),
        c = u.id = "layuicss-" + s,
        d = 0;
        u.rel = "stylesheet",
        u.href = e + (r.debug ? "?v=" + (new Date).getTime() : ""),
        u.media = "all",
        n.getElementById(c) || a.appendChild(u),
        "function" == typeof t && !
        function f() {
            return++d > 1e3 * r.timeout / 100 ? l(e + " timeout") : void(1989 === parseInt(i.getStyle(n.getElementById(c), "width")) ?
            function() {
                t()
            } () : setTimeout(f, 100))
        } ()
    },
    t.fn.addcss = function(e, t, n) {
        layui.link(r.dir + "css/" + e, t, n)
    },
    t.fn.router = function(e) {
        for (var t, n = (e || location.hash).replace(/^#/, "").split("/") || [], o = {
            dir: []
        },
        r = 0; r < n.length; r++) t = n[r].split("="),
        /^\w+=/.test(n[r]) ?
        function() {
            "dir" !== t[0] && (o[t[0]] = t[1])
        } () : o.dir.push(n[r]),
        t = null;
        return o
    },
    t.fn.img = function(e, t, n) {
        var o = new Image;
        return o.src = e,
        o.complete ? t(o) : (o.onload = function() {
            o.onload = null,
            t(o)
        },
        void(o.onerror = function(e) {
            o.onerror = null,
            n(e)
        }))
    },
    t.fn.data = function(e, t) {
        if (e = e || "layui", t = "object" == typeof t ? t: {
            key: t
        },
        window.JSON && window.JSON.parse) {
            try {
                var n = JSON.parse(localStorage[e])
            } catch(o) {
                var n = {}
            }
            return t.value && (n[t.key] = t.value),
            t.remove && delete n[t.key],
            localStorage[e] = JSON.stringify(n),
            t.key ? n[t.key] : n
        }
    },
    t.fn.each = function(e, t) {
        if ("function" == typeof t) if (e = e || [], e.constructor === Array) for (var n = 0; n < e.length && !t(n, e[n]); n++);
        else if (e.constructor === Object) for (var o in e) if (t(o, e[o])) break
    },
    t.fn.hint = function() {
        return {
            error: l
        }
    },
    t.fn.stope = function(e) {
        e = e || window.event,
        e.stopPropagation ? e.stopPropagation() : e.cancelBubble = !0
    },
    t.fn.config = function(e) {
        e = e || {};
        for (var t in e) r[t] = e[t];
        return this
    },
    o.modules = {
        laytpl: "lib/laytpl",
        laypage: "lib/laypage",
        socket: "lib/socket",
        jquery: "lib/jquery",
        layout: "modules/layout",
        layer: "modules/layer",
        laydate: "modules/laydate",
        layim: "modules/layim",
        tree: "modules/tree",
        slide: "modules/slide",
        color: "modules/color",
        editor: "modules/editor",
        table: "modules/table",
        flow: "modules/flow",
        util: "modules/util",
        form: "modules/form",
        code: "modules/code",
        upload: "modules/upload",
        single: "modules/single",
        mobile: "modules/mobile"
    },
    t.fn.modules = function() {
        var e = {};
        for (var t in o.modules) e[t] = o.modules[t];
        return e
    } (),
    t.fn.extend = function(e) {
        var t = this;
        e = e || {};
        for (var n in e) t[n] || t.modules[n] ? l("模块名 " + n + " 已被占用") : t.modules[n] = e[n];
        return t
    },
    e.layui = new t
} (window);