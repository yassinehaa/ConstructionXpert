<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header class="bg-white p-4 shadow-md">
    <div class="max-w-5xl mx-auto flex justify-between items-center">
        <a href="${pageContext.request.contextPath}/" class="text-2xl font-bold text-gray-800">
            ConstructionXPert
        </a>
        <nav class="space-x-4">
            <a href="${pageContext.request.contextPath}/projects"
               class="text-gray-600 hover:text-gray-800 transition duration-200">
                Projets
            </a>
            <a href="${pageContext.request.contextPath}/resources"
               class="text-gray-600 hover:text-gray-800 transition duration-200">
                Ressources
            </a>
        </nav>
    </div>
</header>