<?php

namespace App\Controller\Admin;

use App\Entity\Tests;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class TestController extends BaseController
{
    #[Route('/test', name: 'app_test')]
    public function index(): Response
    {
        return $this->render('test/index.html.twig', [
            'controller_name' => 'TestController',
        ]);
    }
    #[Route('/show/{id}', name: 'app_show')]
    public function show(ManagerRegistry $doctrine, int $id): Response
    {
        $test = $doctrine->getRepository(Tests::class)->find($id);
//        $this->denyAccessUnlessGranted('view', $test);
        return $this->render('test/index.html.twig', []);
    }
}
