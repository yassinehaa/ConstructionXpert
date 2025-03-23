<%@ page language="java" pageEncoding="UTF-8"%>
<style>
    header {
        background: rgba(31, 41, 55, 0.85);
        padding: 1rem;
        box-shadow: 0 8px 32px rgba(0, 0, 0, 0.4);
        position: fixed;
        width: 100%;
        top: 0;
        z-index: 1000;
        backdrop-filter: blur(10px);
        border-bottom: 1px solid rgba(255, 255, 255, 0.1);
    }

    .header-container {
        max-width: 1200px;
        margin: 0 auto;
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 0 1rem;
    }

    .logo {
        font-size: 1.5rem;
        font-weight: 700;
        color: #f3f4f6;
        text-decoration: none;
        text-shadow: 0 2px 4px rgba(0, 0, 0, 0.7);
    }

    nav {
        display: flex;
        gap: 1rem;
    }

    .nav-button {
        display: inline-block;
        padding: 0.5rem 1rem;
        border-radius: 0.375rem;
        color: #ffffff;
        text-decoration: none;
        transition: all 0.3s ease;
        text-align: center;
        font-size: 0.875rem;
        background: rgba(59, 130, 246, 0.8);
        box-shadow: 0 4px 15px rgba(59, 130, 246, 0.4);
    }

    .nav-button:hover {
        background: rgba(37, 99, 235, 0.9);
        transform: translateY(-2px);
        box-shadow: 0 6px 20px rgba(59, 130, 246, 0.6);
    }

    .menu-toggle {
        display: none;
        background: none;
        border: none;
        font-size: 1.5rem;
        cursor: pointer;
        color: #f3f4f6;
    }

    @media (max-width: 768px) {
        .menu-toggle {
            display: block;
        }

        nav {
            display: none;
            position: absolute;
            top: 100%;
            right: 0;
            background: rgba(31, 41, 55, 0.85);
            width: 100%;
            padding: 1rem;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.4);
            flex-direction: column;
            gap: 0.5rem;
            backdrop-filter: blur(10px);
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }

        nav.active {
            display: flex;
        }

        .header-container {
            flex-wrap: wrap;
        }
    }
</style>

<header>
    <div class="header-container">
        <a href="${pageContext.request.contextPath}/" class="logo">ConstructionXPert</a>
        <button class="menu-toggle">☰</button>
        <nav>
            <a href="${pageContext.request.contextPath}/projects" class="nav-button">Projets</a>
            <a href="${pageContext.request.contextPath}/resources" class="nav-button">Ressources</a>
        </nav>
    </div>
</header>

<script>
    const menuToggle = document.querySelector('.menu-toggle');
    const nav = document.querySelector('nav');

    menuToggle.addEventListener('click', () => {
        nav.classList.toggle('active');
    });

    document.addEventListener('DOMContentLoaded', () => {
        const header = document.querySelector('header');
        const body = document.querySelector('body');
        if (header && body) {
            body.style.paddingTop = `${header.offsetHeight}px`;
        }

        window.addEventListener('resize', () => {
            body.style.paddingTop = `${header.offsetHeight}px`;
        });
    });
</script>